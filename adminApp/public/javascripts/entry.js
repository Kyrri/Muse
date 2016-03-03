$(document).ready(function(){

	// PAGE VARIABLES
	var elementTagTypes = [];
	var elementTags = [];
	var museums = [];
	var exhibits = [];
	var selectedTagType = '';

	// FUNCTIONS
	// gets a list of tag types
	function appendOptions(id,options) {
		$(id).empty().append('<option selected disabled>Select value</option>')
		for (x in options) {
			$(id).append('<option>' + options[x] + '</options>');
		}
	}

	function getTagTypeList() {
		elementTagTypes = [];
		//console.log(elementTagTypes)

		var parameters = JSON.stringify({
			'queryType': null, 
			'queryVal': 'elementTagType'
		});
		$.ajax('entry',{
			type: "POST",
			contentType: "application/json",
		 	dataType: 'JSON',
			data: parameters,
			success: function(results){
				// read the tag types into an array
				for (x in results) {
	        		//console.log(results[x]);
	        		elementTagTypes[x] = results[x].elementTagType;
	      		}
	      		//console.log(elementTagTypes);

	      		appendOptions('#addTagForm-elementTagType', elementTagTypes);
			}
		});
	}

	function getMuseumList() {
		museums = [];

		var parameters = JSON.stringify({
			'queryType': null, 
			'queryVal': 'museum'
		});
		$.ajax('entry',{
			type: "POST",
			contentType: "application/json",
		 	dataType: 'JSON',
			data: parameters,
			success: function(results){
				// read the tag types into an array
				for (x in results) {
	        		museums[x] = results[x].museumName;
	      		}
	      		appendOptions('#tagElementForm-museum', museums);
			}
		});
	}

	// gets tags of a particular tag type, store in in page variable
	function getTagList(tagType) {
		elementTags = [];
		var parameters = JSON.stringify({
			'queryType': 0, // see cases in app.js
			'queryVal': tagType
		});
		$.ajax('entry',{
			type: "POST",
			contentType: "application/json",
		 	dataType: 'JSON',
			data: parameters,
			success: function(results){
				// read the tag types into an array
				//console.log(results);
				for (x in results) {
	        		//console.log(results[x]);
	        		elementTags[x] = results[x].elementTag;
	      		}
	      		console.log(elementTags);
			}
		});
	}

	function getExhibitList(museum) {
		elementTags = [];
		var parameters = JSON.stringify({
			'queryType': 1, // see cases in app.js
			'queryVal': museum
		});
		$.ajax('entry',{
			type: "POST",
			contentType: "application/json",
		 	dataType: 'JSON',
			data: parameters,
			success: function(results){
				// read the tag types into an array
				//console.log(results);
				for (x in results) {
	        		//console.log(results[x]);
	        		exhibits[x] = results[x].exhibitName;
	      		}
	      		//console.log(exhibits);
	      		appendOptions('#tagElementForm-exhibit', exhibits);
			}
		});
	}


	// load the tag types
	getTagTypeList();
	getMuseumList();

  	// hide the addElementTag form
	$('#addTagWindow').hide();
	$('#tagElementWindow').hide();

	// CLICK ACTIONS
	// get tagTypeList
	$('#tagTypeList').click(function(){
		getTagTypeList();
		$(document).ajaxComplete(function() {
		    // display the tag types as a list
			$('#tagTypeList').html('Click tag type to select');
			$('#tagTypeList-results').empty();
			for (x in elementTagTypes) {
				//console.log(results[x]);
				$('#tagTypeList-results').append('<div class="tagType">'+elementTagTypes[x]+'</div>');
			}
		});
	});

	// keep track of tag type varialbe 
	$('#tagTypeList-results').on('click','div.tagType',function(){
		$('.tagType').removeAttr('id');
		$(this).attr('id','selectedTagType');
		selectedTagType = $(this).text();
		//console.log(selectedTagType);
	});

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

		function tagElement() {

		}	

		museum.change(function(){
			//console.log(museum.val());
			getExhibitList(museum.val());
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
		getExhibitList('Muse Sample');
	});
	

});