$(document).ready(function(){

	// PAGE VARIABLES
	var selectedTagType = '';

	// FUNCTIONS
	function logLists(var_array) {
		for (x in var_array) {
			console.log(var_array[x]);
		}
	}

	function appendOptions(ids,options) {
		// appends list options to select forms given ids
		for (id in ids) {
			$(ids[id]).empty().append('<option selected disabled>Select value</option>')
			for (x in options) {
				$(ids[id]).append('<option>' + options[x] + '</options>');
			}
		}
	}

	function getLists(params,col,append_ids) {
		// gets lists of values from the db, uses the 'exec_qry' parameter format
		// returns an array

		var var_array = [];
		$.ajax('exec_qry',{
			type : 'POST',
			contentType : 'application/json',
			dataType : 'JSON',
			data : params,
			success : function(results){
				for (x in results) {
					var_array[x] = results[x][col];
				}
				appendOptions(append_ids,var_array);
				logLists(var_array);
			}
		});
		return var_array;
	}

	// FUNCTIONS WITH STATIC DATA
	function getElementTagTypeList(ids) {
		var parameters = JSON.stringify({
			'table': 'elementTagType'
		});
		getLists(parameters,'elementTagType',ids);
	}

	function getMuseumList(ids) {
		var parameters = JSON.stringify({
			'table': 'museum'
		});
		getLists(parameters,'museumName',ids);
	}

	function getElementTagList(elementTagType,ids) {
		var parameters = JSON.stringify({
			'table' : 'elementTag',
			'clauses' : {
				'elementTagTypeId' : "f_getElementTagTypeId('" + elementTagType + "')" 
			}
		});
		getLists(parameters,'elementTag',ids);
	}

	function getExhibitList(museum,ids) {
		var parameters = JSON.stringify({
			'table' : 'exhibit',
			'clauses' : {
				'museumId' : "f_getMuseumId('" + museum + "')" 
			}
		});
		getLists(parameters,'exhibitName',ids);
	}

	function getElementList(exhibit,ids) {
		var parameters = JSON.stringify({
			'table' : 'element',
			'clauses' : {
				'exhibitId' : "f_getExhibitId('" + exhibit + "')"
			}
		});
		getLists(parameters,'title',ids);
	}

	// debugging stuff 
	//getElementTagList('Industry');
	/*$(document).ajaxComplete(function(){
		logLists(elementTagTypes);
	});*/

  	// hide the addElementTag form
	$('#addTagWindow').hide();
	$('#tagElementWindow').hide();

	// CLICK ACTIONS
	// get tagTypeList
	$('#tagTypeList').click(function(){
		getElementTagTypeList([
			'#tagTypeList-results'
		]);
		$(this).hide();
	});

	// keep track of tag type varialbe 
	$('#tagTypeList-results').on('click','option',function(){
		$('option').removeAttr('id');
		$(this).attr('id','selectedTagType');
		selectedTagType = $(this).text();
		//console.log(selectedTagType);
	});

	// FORMS
	// add element tag form 
    $( "#addTagButton" ).click(function() {
      	var dialog, form, err;
      	var tag = $('#addTagForm-elementTag');
      	var tagType = $('#addTagForm-elementTagType');

		function errCheck(errCode) {
			var errMsg;
			switch(errCode){
				case -1:
					errMsg = 'Invalid tag type.';
					break;
				case -2:
					errMsg = 'Tag already exists.';
					break;	
				case 0:
					errMsg = 'Tag added successfully.';
					break;
			}
			return errMsg;
		}

		function addTag() {
			var params = JSON.stringify({
				'sp' : 'insert_elementTag',
				'input_params' : {
					'elementTag' : tag.val(),
					'elementTagType' : tagType.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					//console.log(results[1][0].success);
					err = results[1][0]['@o1'];
					//console.log(errCheck(err));
					if (err == 0) {
						//alert(errCheck(err));
						//console.log(errCheck(err));
						dialog.dialog('close');
					} else {
						alert(errCheck(err));
						//console.log(errCheck(err));
					}
				}
			});
		}	

		// list dependencies
		getElementTagTypeList([
			'#addTagForm-elementTagType'
		]);

		dialog = $("#addTagWindow").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
				"Add Tag" : addTag,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[ 0 ].reset();
	    	}
		});

		form = dialog.find( "form" ).on( "submit", function( event ) {
	      	event.preventDefault();
	      	addTag();
	    });

      	dialog.dialog( "open" );
    });

	// add element tag form 
    $( "#tagElementButton" ).click(function() {
      	var dialog, form, err;
      	var museum = $('#tagElementForm-museum');
      	var exhibit = $('#tagElementForm-exhibit');
      	var element = $('#tagElementForm-element');
      	var tagType = $('#tagElementForm-tagType');
      	var tag = $('#tagElementForm-tag');
      	var museumBox = $('#tagElementForm-museumBox');
      	var exhibitBox = $('#tagElementForm-exhibitBox');
      	var elementBox = $('#tagElementForm-elementBox');

		function tagElement() {

			var params = JSON.stringify({
				'sp' : 'insert_elementTagMapping',
				'input_params' : {
					'element' : element.val(),
					'exhibit' :  exhibit.val(),
					'elementTag' : tag.val()
				},
				'output_params' : 1
			});

			console.log(tag.val());
			console.log(params);

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					//console.log(results[1][0].success);
					err = results[1][0]['@o1'];
					//console.log(errCheck(err));
					if (err == -1) {
						alert('Error');
						dialog.dialog('close');
					} else {
						dialog.dialog('close');
					}
				}
			});
		}	

		// list dependencies
		museumBox.show();
		exhibitBox.hide();
		elementBox.hide();

		getMuseumList([
			'#tagElementForm-museum'
		]);

		getElementTagTypeList([
			'#tagElementForm-tagType'
		]);

		museum.change(function(){
			// update exhibit list when museum selected
			getExhibitList(museum.val(),[
				'#tagElementForm-exhibit'
			]);
			museumBox.hide();
			exhibitBox.show();
		});

		exhibit.change(function(){
			// update element list when exhibit selected
			getElementList(exhibit.val(),[
				'#tagElementForm-element'
			]);
			exhibitBox.hide();
			elementBox.show();
		});

		tagType.change(function(){
			getElementTagList(tagType.val(),[
				'#tagElementForm-tag'
			])
		});

		dialog = $("#tagElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
				"Add Tag" : tagElement,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[ 0 ].reset();
	    	}
		});

		form = dialog.find( "form" ).on( "submit", function( event ) {
	      	event.preventDefault();
	      	tagElement();
	    });

      	dialog.dialog( "open" );
    });
    
	


	// testButton
	$('#testButton').click(function(){
		getMuseumList();
	});
	

});