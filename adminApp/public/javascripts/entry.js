$(document).ready(function(){

	// PAGE VARIABLES
	var selectedTagType = '';

	function loadTasks() {
		getMuseumList(['#museumSelector']);
		
		$('#addTagWindow').hide();
		$('#tagElementWindow').hide();
		$('#addExhibitWindow').hide();
		$('#addElementWindow').hide();
		$('#hidden-exhibitList').hide();
	}

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
				//logLists(var_array);
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
				'museumId' : "f_getMuseumId('" + museum + "')",
				'active' : 1
			}
		});
		getLists(parameters,'exhibitName',ids);
	}

	function getElementList(exhibit,ids) {
		var parameters = JSON.stringify({
			'table' : 'element',
			'clauses' : {
				'exhibitId' : "f_getExhibitId('" + exhibit + "')",
				'active' : 1
			}
		});
		getLists(parameters,'title',ids);
	}

	function getArtistList(ids) {
		var parameters = JSON.stringify({
			'table' : 'artist'
		});
		getLists(parameters,'artist',ids);
	}

	function sqlErrCheck(errCode) {
		var errMsg;
		switch(errCode){
			case -1:
				errMsg = 'Unexpect SQL Error.';
				break;
			case -2:
				errMsg = 'Insert Failed. Record already exists.';
				break;	
			case 0:
				errMsg = 'Success.';
				break;
		}
		return errMsg;
	}

	// DYNATABLES
	function loadvElementsTable(museum, exhibit, active) {
		var dbParams;
		//console.log([museum,exhibit,active]);
		if (active=='All') {
			if (!exhibit) {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museum' : "'" + museum + "'"
					}
				});
			} else {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museum' : "'" + museum + "'",
						'exhibit' : "'" + exhibit + "'"
					}
				});
			}
		} else {
			if (!exhibit) {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museum' : "'" + museum + "'",
						'active' : "'" + active + "'"
					}
				});
			} else {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museum' : "'" + museum + "'",
						'exhibit' : "'" + exhibit + "'",
						'active' : "'" + active + "'"
					}
				});
			}
		}
		$.ajax('exec_qry',{
			type : 'POST',
			contentType : 'application/json',
			dataType : 'JSON',
			data : dbParams,
			success : function(results){
				var dynatable = $('#vElementsTable').dynatable({
					dataset : {
						records : results
					}
				}).data('dynatable');
				dynatable.settings.dataset.originalRecords = results;
                dynatable.process();
			}
		});
	}

	function loadvTagsTable(element,active) {
		var dbParams;
		//console.log([museum,exhibit,active]);
		if (active=='All') {
			dbParams = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'element' : "'" + element + "'"
				}
			});
		} else {
			dbParams = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'element' : "'" + element + "'",
					'active' : "'" + active + "'"
				}
			});
		}
		$.ajax('exec_qry',{
			type : 'POST',
			contentType : 'application/json',
			dataType : 'JSON',
			data : dbParams,
			success : function(results){
				var dynatable = $('#vTagsTable').dynatable({
					dataset : {
						records : results
					}
				}).data('dynatable');
				dynatable.settings.dataset.originalRecords = results;
                dynatable.process();
			}
		});
	}

	function loadvExhibitsTable(museum) {
		var dbParams = JSON.stringify({
			'table' : 'v_exhibits',
			'clauses' : {
				'museum' : "'" + museum + "'"
			}
		});
		$.ajax('exec_qry',{
			type : 'POST',
			contentType : 'application/json',
			dataType : 'JSON',
			data : dbParams,
			success : function(results){
				var dynatable = $('#vExhibitsTable')
				dynatable.dynatable({
					features : {
						paginate : false,
						search : false,
						recordCount : false
					},
					dataset: { records: results
					}  
				}).data('dynatable');
				dynatable.settings.dataset.originalRecords = results;
                dynatable.process();
			}
		});
	}

	// debugging stuff 
	//getElementTagList('Industry');
	/*$(document).ajaxComplete(function(){
		logLists(elementTagTypes);
	});*/
	
	loadTasks();

	$('#museumSelector').change(function(){
		getExhibitList($(this).val(),['#exhibitSelector']);
		loadvElementsTable(
			$(this).val(),
			undefined,
			$('#vElementsTable-activeSelector').val()
		);
	});
	$('#exhibitSelector').change(function(){
		getElementList($(this).val(),['#vTagsTable-elementSelector'])
		loadvElementsTable(
			$('#museumSelector').val(),
			$(this).val(),
			$('#vElementsTable-activeSelector').val()
		);
	});
	$('#vElementsTable-activeSelector').change(function(){
		loadvElementsTable(
			$('#museumSelector').val(),
			$('#exhibitSelector').val(),
			$(this).val()
		);
	});
	$('#vTagsTable-elementSelector').change(function(){
		loadvTagsTable(
			$(this).val(),
			$('#vTagsTable-activeSelector').val()
		);
	});
	$('#vTagsTable-activeSelector').change(function(){
		loadvTagsTable(
			$('#vTagsTable-elementSelector').val(),
			$(this).val()
		);
	});


	// CLICK ACTIONS
	/* Deprecated
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
	*/

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
					loadvTagsTable();
				}
			});
		}	

		// list dependencies
		museumBox.show();
		exhibitBox.hide();
		elementBox.hide();

		getMuseumList(['#tagElementForm-museum']);
		getElementTagTypeList(['#tagElementForm-tagType']);
		museum.change(function(){
			// update exhibit list when museum selected
			getExhibitList(museum.val(),['#tagElementForm-exhibit']);
			museumBox.hide();
			exhibitBox.show();
		});
		exhibit.change(function(){
			// update element list when exhibit selected
			getElementList(exhibit.val(),['#tagElementForm-element']);
			exhibitBox.hide();
			elementBox.show();
		});
		tagType.change(function(){
			getElementTagList(tagType.val(),['#tagElementForm-tag'])
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

	//  ADD EXHIBIT FORM  //
	$('#addExhibitButton').click(function(){

		var dialog, form;
      	var museum = $('#addExhibitForm-museum');
      	var exhibit = $('#addExhibitForm-exhibit');
      	var museumBox = $('#addExhibitForm-museumBox');
      	var exhibitBox = $('#addExhibitForm-exhibitBox');

		function submitForm() {

			var params = JSON.stringify({
				'sp' : 'insert_exhibit',
				'input_params' : {
					'museum' : museum.val(),
					'exhibit' :  exhibit.val()
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
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
				}
			});
		}	

		// list dependencies
		getMuseumList([
			'#addExhibitForm-museum'
		]);

		dialog = $("#addExhibitWindow").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
				"Add Tag" : submitForm,
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
	      	submitForm();
	    });

      	dialog.dialog( "open" );

	});

	//  SHOW EXHIBITS BUTTON  //
	$('#showExhibitsButton').click(function(){
		var dialog, form;
		var museum = $('#vExhibitsTableFilter-museum');

		$('#vExhibitsTableFilter').show();
		$('#vExhibitsTable').hide();
		getMuseumList([
			'#vExhibitsTableFilter-museum'
		]);

		$('#vExhibitsTableFilter-museum').change(function(){
			$('#vExhibitsTableFilter').hide();
			loadvExhibitsTable(museum.val());
			$('#vExhibitsTable').show();
		});

		dialog = $("#hidden-exhibitList").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
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
	    });

      	dialog.dialog( "open" );
	});

	//  ADD ELEMENT BUTTON  //
	$('#addElementButton').click(function(){
		var dialog, form;
		var museum = $('#addElementForm-museum');
		var exhibit = $('#addElementForm-exhibit');
		var element = $('#addElementForm-element');
		var artist = $('#addElementForm-aritst');
		var year = $('#addElementForm-year');
		var desc = $('#addElementForm-description');
		var link = $('#addElementForm-imageLink');

		var museumBox = $('#addElementForm-museumBox');
		var exhibitBox = $('#addElementForm-exhibitBox');

		// hide show control 
		museumBox.show();
		exhibitBox.hide();

		// populate lists
		getMuseumList(['#addElementForm-museum']);
		getArtistList(['#addElementForm-aritst']);
		museum.change(function(){
			// update exhibit list when museum selected
			getExhibitList(museum.val(),['#addElementForm-exhibit']);
			museumBox.hide();
			exhibitBox.show();
		});

		function submitForm() {
			var params = JSON.stringify({
				'sp' : 'insert_element',
				'input_params' : {
					'exhibit' : exhibit.val(),
					'title' :  element.val(),
					'artist' : artist.val(),
					'year' : year.val(),
					'description' : desc.val(),
					'imgLink' : link.val()
				},
				'output_params' : 1
			});

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
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable();
				}
			});
		}

		dialog = $("#addElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
				"Add Tag" : submitForm,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[0].reset();
	    	}
		});

		form = dialog.find("form").on("submit", function( event ) {
	      	event.preventDefault();
	      	submitForm();
	    });

      	dialog.dialog("open");
	});
    
	


	// testButton
	$('#testButton').click(function(){
		getMuseumList();
	});
	

});