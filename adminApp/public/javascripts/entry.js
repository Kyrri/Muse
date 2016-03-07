$(document).ready(function(){

	// PAGE VARIABLES
	var selectedTagType = '';

	function loadTasks() {
		getMuseumList(['#museumSelector']);
		
		$('#addTagWindow').hide();
		$('#tagElementWindow').hide();
		$('#addExhibitWindow').hide();
		$('#addElementWindow').hide();
		$('#deleteElementWindow').hide();
		$('#restoreElementWindow').hide();
		$('#codeElementWindow').hide();
		$('#editElementWindow').hide();
		$('#hidden-exhibitList').hide();
		$('#addArtistWindow').hide();
		$('#deleteElementTagWindow').hide();
		$('#restoreElementTagWindow').hide();

		// Disable buttons on start until requisite fields are filled 
		$('#addElementButton').prop('disabled', true);
		$('#deleteElementButton').prop('disabled', true);
		$('#restoreElementButton').prop('disabled', true);
		$('#editElementButton').prop('disabled', true);
		$('#codeElementButton').prop('disabled', true);
		$('#deleteElementTagButton').prop('disabled', true);
		$('#restoreElementTagButton').prop('disabled', true);

		$('#tagElementButton').prop('disabled', true);

		$('#exhibitSelector').prop('disabled', true);
		$('#vTagsTable-elementSelector').prop('disabled', true);
	}

	// FUNCTIONS
	function logLists(var_array) {
		for (x in var_array) {
			console.log(var_array[x]);
		}
	}

	function appendOptions(ids,options,val) {
		// appends list options to select forms given ids
		for (id in ids) {
			$(ids[id]).empty().append('<option selected disabled>Select value</option>');
			for (x in options) {
				$(ids[id]).append('<option value="' + val[x] + '">' + options[x] + '</options>');
			}
		}
	}

	function getLists(params,col,idCol,append_ids) {
		// gets lists of values from the db, uses the 'exec_qry' parameter format
		// returns an array

		var var_array = [];
		var id_array = [];
		$.ajax('exec_qry',{
			type : 'POST',
			contentType : 'application/json',
			dataType : 'JSON',
			data : params,
			success : function(results){
				for (x in results) {
					var_array[x] = results[x][col];
					id_array[x] = results[x][idCol];
				}
				appendOptions(append_ids,var_array,id_array);
				//logLists(var_array);
			}
		});
		return var_array;
	}

	// FUNCTIONS WITH STATIC DATA
	function getTableFields(table,ids) {
		var params = JSON.stringify({
				'table' : 'element'
			});
		$.ajax('exec_qryFields',{
			type: "POST",
			contentType: "application/json",
	 		dataType: 'JSON',
			data: params,
			success: function (results,err){
				var var_array = [];
				if (err!='success') {
					console.log(err);
				} else {
					console.log(results);
					for (x in results) {
						var_array[x] = results[x]['Field'];
					}
				appendOptions(ids,var_array);
				}
			}
		});
	}

	function getElementTagTypeList(ids) {
		var parameters = JSON.stringify({
			'table': 'elementTagType'
		});
		getLists(parameters,'elementTagType','elementTagTypeId',ids);
	}

	function getArtistList(ids) {
		var parameters = JSON.stringify({
			'table' : 'artist'
		});
		getLists(parameters,'artist','artistId',ids);
	}

	function getMuseumList(ids) {
		var parameters = JSON.stringify({
			'table': 'museum'
		});
		getLists(parameters,'museumName','museumId',ids);
	}

	function getElementTagList(elementTagType,ids) {
		var parameters = JSON.stringify({
			'table' : 'elementTag',
			'clauses' : {
				'elementTagTypeId' : elementTagType
			}
		});
		getLists(parameters,'elementTag','elementTagId',ids);
	}

	function getElementTagMappingList(elementId,ids,inactive) {
		if (!inactive){
			var parameters = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'elementId' : elementId,
					'active' : "'Active'"
				}
			});
		} else {
			var parameters = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'elementId' : elementId,
					'active' : "'Inactive'"
				}
			});
		}
		getLists(parameters,'tag','elementTagId',ids);
	}

	function getExhibitList(museum,ids) {
		var parameters = JSON.stringify({
			'table' : 'exhibit',
			'clauses' : {
				'museumId' : museum,
				'active' : 1
			}
		});
		getLists(parameters,'exhibitName','exhibitId',ids);
	}

	function getElementList(exhibit,ids,inactive) {
		if (!inactive){
			var parameters = JSON.stringify({
				'table' : 'element',
				'clauses' : {
					'exhibitId' : exhibit,
					'active' : 1
				}
			});
		} else {
			var parameters = JSON.stringify({
				'table' : 'element',
				'clauses' : {
					'exhibitId' : exhibit,
					'active' : 0
				}
			});
		}
		getLists(parameters,'title','elementId',ids);
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
			case -3:
				errMsg = 'Update Failed. Record does not exists.'
			case -4:
				errMsg = 'Code already in use.'
				break;
			case 0:
				errMsg = 'Success.';
				break;
		}
		return errMsg;
	}

	// DYNATABLES
	//  Museum elements table
	function loadvElementsTable(museumId, exhibitId, active) {
		var dbParams;
		//console.log([museum,exhibit,active]);
		if (active=='All') {
			if (!exhibitId) {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museumId' : museumId
					}
				});
			} else {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museumId' : museum,
						'exhibitId' : exhibitId
					}
				});
			}
		} else {
			if (!exhibitId) {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museumId' : museumId,
						'active' : "'" + active + "'"
					}
				});
			} else {
				dbParams = JSON.stringify({
					'table' : 'v_elements',
					'clauses' : {
						'museumId' : museumId,
						'exhibitId' : exhibitId,
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

	function loadvTagsTable(elementId,active) {
		var dbParams;
		//console.log([museum,exhibit,active]);
		if (active=='All') {
			dbParams = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'elementId' : elementId
				}
			});
		} else {
			dbParams = JSON.stringify({
				'table' : 'v_tags',
				'clauses' : {
					'elementId' : elementId,
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

	function loadvExhibitsTable(museumId) {
		var dbParams = JSON.stringify({
			'table' : 'v_exhibits',
			'clauses' : {
				'museumId' : museumId
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
		$('#exhibitSelector').prop('disabled', false);
	});
	$('#exhibitSelector').change(function(){
		getElementList($(this).val(),['#vTagsTable-elementSelector'])
		loadvElementsTable(
			$('#museumSelector').val(),
			$(this).val(),
			$('#vElementsTable-activeSelector').val()
		);
		$('#addElementButton').prop('disabled', false);
		$('#deleteElementButton').prop('disabled', false);
		$('#restoreElementButton').prop('disabled', false);
		$('#editElementButton').prop('disabled', false);
		$('#codeElementButton').prop('disabled', false);
		$('#vTagsTable-elementSelector').prop('disabled', false);
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
		$('#tagElementButton').prop('disabled', false);
		$('#deleteElementTagButton').prop('disabled', false);
		$('#restoreElementTagButton').prop('disabled', false);
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
      	var dialog, form;
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
					var err = results[1][0]['@o1'];
					//console.log(errCheck(err));
					if (err == 0) {
						//alert(errCheck(err));
						//console.log(errCheck(err));
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
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
      	var dialog, form;
      	var museum = $('#museumSelector');
      	var exhibit = $('#exhibitSelector');
      	var element = $('#vTagsTable-elementSelector');
      	var tagType = $('#tagElementForm-tagType');
      	var tag = $('#tagElementForm-tag');
      	//var museumBox = $('#tagElementForm-museumBox');
      	//var exhibitBox = $('#tagElementForm-exhibitBox');
      	//var elementBox = $('#tagElementForm-elementBox');

		function tagElement() {

			var params = JSON.stringify({
				'sp' : 'insert_elementTagMapping',
				'input_params' : {
					'elementId' : element.val(),
					'elementTagId' : tag.val()
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
					var err = results[1][0]['@o1'];
					//console.log(errCheck(err));
					if (err == 0) {
						//alert('Error');
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvTagsTable(element.val(),$('#vTagsTable-activeSelector').val());
				}
			});
		}	

		// list dependencies
		/*museumBox.show();
		exhibitBox.hide();
		elementBox.hide();

		getMuseumList(['#tagElementForm-museum']);
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
		});*/
		getElementTagTypeList(['#tagElementForm-tagType']);
		tagType.change(function(){
			getElementTagList(tagType.val(),['#tagElementForm-tag'])
		});

		dialog = $("#tagElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title : 'Add tag to - ' + $('#vTagsTable-elementSelector option:selected').text(),
			buttons: {
				"Tag Element" : tagElement,
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
					'museumId' : museum.val(),
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
					var err = results[1][0]['@o1'];
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
				"Add Exhibit" : submitForm,
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
		var museum = $('#museumSelector');//$('#addElementForm-museum');
		var exhibit = $('#exhibitSelector');//$('#addElementForm-exhibit');
		var element = $('#addElementForm-element');
		var artist = $('#addElementForm-aritst');
		var year = $('#addElementForm-year');
		var desc = $('#addElementForm-description');
		var link = $('#addElementForm-imageLink');

		var museumBox = $('#addElementForm-museumBox');
		var exhibitBox = $('#addElementForm-exhibitBox');

		// hide show control 
		//museumBox.show();
		//exhibitBox.hide();

		// populate lists
		//getMuseumList(['#addElementForm-museum']);
		getArtistList(['#addElementForm-aritst']);
		/*museum.change(function(){
			// update exhibit list when museum selected
			getExhibitList(museum.val(),['#addElementForm-exhibit']);
			museumBox.hide();
			exhibitBox.show();
		});*/

		function submitForm() {
			var params = JSON.stringify({
				'sp' : 'insert_element',
				'input_params' : {
					'exhibitId' : exhibit.val(),
					'title' :  element.val(),
					'artistId' : artist.val(),
					'year' : year.val(),
					'description' : desc.val(),
					'imgLink' : link.val()
				},
				'output_params' : 1
			});

			//console.log(params);

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					//console.log(results[1][0].success);
					var err = results[1][0]['@o1'];
					//console.log(errCheck(err));
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable(
						$('#museumSelector').val(),
						$('#exhibitSelector').val(),
						$('#vElementsTable-activeSelector').val()
					);
				}
			});
		}

		dialog = $("#addElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Add element to exhibit - ' + $("#exhibitSelector option:selected").text(),
			buttons: {
				"Add Element" : submitForm,
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

	// DELETE ELEMENT BUTTON
	$('#deleteElementButton').click(function(){
		var dialog, form;
		var museum = $('#museumSelector');
		var exhibit = $('#exhibitSelector');
		var element = $('#deleteElementForm-element');

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'delete_element',
				'input_params' : {
					'elementId' : element.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable(
						$('#museumSelector').val(),
						$('#exhibitSelector').val(),
						$('#vElementsTable-activeSelector').val()
					);
				}
			});
		}

		getElementList(exhibit.val(),['#deleteElementForm-element']);

		dialog = $("#deleteElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Delete element from exhibit - ' + $("#exhibitSelector option:selected").text(),
			buttons: {
				"Delete Element" : submitForm,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[0].reset();
	    	}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	$('#restoreElementButton').click(function(){
		var dialog, form;
		var museum = $('#museumSelector');
		var exhibit = $('#exhibitSelector');
		var element = $('#restoreElementForm-element');

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'restore_element',
				'input_params' : {
					'elementId' : element.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable(
						$('#museumSelector').val(),
						$('#exhibitSelector').val(),
						$('#vElementsTable-activeSelector').val()
					);
				}
			});
		}

		getElementList(exhibit.val(),['#restoreElementForm-element'],true);

		dialog = $("#restoreElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Restore element from exhibit - ' + $("#exhibitSelector option:selected").text(),
			buttons: {
				"Restore Element" : submitForm,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[0].reset();
	    	}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	//  CODE ELEMENT FORM //
	$('#codeElementButton').click(function(){
		var dialog, form;
		var museum = $('#museumSelector');
		var exhibit = $('#exhibitSelector');
		var element = $('#codeElementForm-element');
		var code = $('#codeElementForm-code');

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'insert_elementCode',
				'input_params' : {
					'elementId' : element.val(),
					'elementCode' : code.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable(
						$('#museumSelector').val(),
						$('#exhibitSelector').val(),
						$('#vElementsTable-activeSelector').val()
					);
				}
			});
		}

		getElementList(exhibit.val(),['#codeElementForm-element']);

		dialog = $("#codeElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Code element from exhibit - ' + $("#exhibitSelector option:selected").text(),
			buttons: {
				"Code Element" : submitForm,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[0].reset();
	    	}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	//  EDIT ELEMENT FORM //
	$('#editElementButton').click(function(){
		var dialog, form;
		var museum = $('#museumSelector');
		var exhibit = $('#exhibitSelector');
		var element = $('#editElementForm-element');
		var field = $('#editElementForm-field');
		var value;
		var valueBox = $('#editElementForm-valueBox');

		var table = JSON.stringify({'table':'element'});

		function submitForm(){
			var sqlField;
			var sqlValue = value.val();
			switch(field.val()){
				case 'Description':
					sqlField = 'description';
					break;
				case 'Active':
					sqlField = 'active';
					switch(sqlValue){
						case 'Active' :
							sqlValue = 1;
							break;
						case 'Inactive' :
							sqlValue = 0;
							break;
					}
					break;
				case 'Exhibit':
					sqlField = 'exhibitId';
					break;
				case 'Element Name':
					sqlField = 'title';
					break;
				case 'Artist':
					sqlField = 'artistId';
					break;
				case 'Year':
					sqlField = 'paintYear';
					break;
				case 'Image Link':
					sqlField = 'imageLink';
					break;
			}

			var params = JSON.stringify({
				'sp' : 'update_element',
				'input_params' : {
					'elementId' : element.val(),
					'field' : sqlField,
					'value' : sqlValue
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {
						dialog.dialog('close');
					} else {
						alert(sqlErrCheck(err));
					}
					loadvElementsTable(
						$('#museumSelector').val(),
						$('#exhibitSelector').val(),
						$('#vElementsTable-activeSelector').val()
					);
				}
			});
		}

		valueBox.hide();
		getElementList(exhibit.val(),['#editElementForm-element']);
		field.change(function(){
			switch(field.val()){
				case 'Description':
					valueBox.empty().append('<label for="value">Enter Description (max 500 characters):')
					valueBox.append('<input id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					break;
				case 'Active':
					valueBox.empty().append('<label for="value">Active:')
					valueBox.append('<select id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					value.append('<option value="1">Active</option>');
					value.append('<option value="0">Inactive</option>');
					break;
				case 'Exhibit':
					valueBox.empty().append('<label for="value">Exhibit:')
					valueBox.append('<select id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					getExhibitList(museum.val(),['#editElementForm-value']);
					break;
				case 'Element Name':
					valueBox.empty().append('<label for="value">Enter Element Name:')
					valueBox.append('<input id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					break;
				case 'Artist':
					valueBox.empty().append('<label for="value">Artist:')
					valueBox.append('<select id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					getArtistList(['#editElementForm-value']);
					break;
				case 'Year':
					valueBox.empty().append('<label for="value">Enter Year:')
					valueBox.append('<input id="editElementForm-value", type="number", name="value">');
					value = $('#editElementForm-value');
					break;
				case 'Image Link':
					valueBox.empty().append('<label for="value">Enter Image Link (URL):')
					valueBox.append('<input id="editElementForm-value", type="text", name="value">');
					value = $('#editElementForm-value');
					break;
			}
			valueBox.show();
		});

		dialog = $("#editElementWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Edit element from exhibit - ' + $("#exhibitSelector option:selected").text(),
			buttons: {
				"Edit Element" : submitForm,
				Cancel: function() {
					dialog.dialog('close');
				}
			},
			close: function() {
		        form[0].reset();
	    	}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	$('#addArtistButton').click(function(){
		var dialog, form;
		var artistName = $('#addArtistForm-artist');

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'insert_artist',
				'input_params' : {
					'artist' : artistName.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {dialog.dialog('close');} else {alert(sqlErrCheck(err));}
				}
			});
		}

		dialog = $("#addArtistWindow").dialog({
			autoOpen: false, 
			modal: true,
			buttons: {
				"Add Artist" : submitForm,
				Cancel: function() {dialog.dialog('close');}
			},
			close: function(){form[0].reset();}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	$('#deleteElementTagButton').click(function(){
		var dialog, form;
		var elementId = $('#vTagsTable-elementSelector');
		var elementTagId = $('#deleteElementTagForm-tag');;

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'delete_elementTagMapping',
				'input_params' : {
					'elementTag' : elementId.val(),
					'elementTagId' : elementTagId.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {dialog.dialog('close');} else {alert(sqlErrCheck(err));}
					loadvTagsTable($('#vTagsTable-elementSelector').val(),$('#vTagsTable-activeSelector').val());
				}
			});
		}

		getElementTagMappingList(elementId.val(),['#deleteElementTagForm-tag'])

		dialog = $("#deleteElementTagWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Delete tags for - ' + $('#vTagsTable-elementSelector option:selected').text(),
			buttons: {
				"Delete ElementTag" : submitForm,
				Cancel: function() {dialog.dialog('close');}
			},
			close: function(){form[0].reset();}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	$('#restoreElementTagButton').click(function(){
		var dialog, form;
		var elementId = $('#vTagsTable-elementSelector');
		var elementTagId = $('#restoreElementTagForm-tag');;

		function submitForm(){
			var params = JSON.stringify({
				'sp' : 'restore_elementTagMapping',
				'input_params' : {
					'elementTag' : elementId.val(),
					'elementTagId' : elementTagId.val()
				},
				'output_params' : 1
			});

			$.ajax('exec_sp',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					var err = results[1][0]['@o1'];
					if (err == 0) {dialog.dialog('close');} else {alert(sqlErrCheck(err));}
					loadvTagsTable($('#vTagsTable-elementSelector').val(),$('#vTagsTable-activeSelector').val());
				}
			});
		}

		getElementTagMappingList(elementId.val(),['#restoreElementTagForm-tag'],true)

		dialog = $("#restoreElementTagWindow").dialog({
			autoOpen: false, 
			modal: true,
			title: 'Restore tags for - ' + $('#vTagsTable-elementSelector option:selected').text(),
			buttons: {
				"Restore ElementTag" : submitForm,
				Cancel: function() {dialog.dialog('close');}
			},
			close: function(){form[0].reset();}
		});
		form = dialog.find("form").on("submit",function(event){event.preventDefault();submitForm();});
      	dialog.dialog("open");

	});

	// testButton
	$('#testButton').click(function(){
		
	});
	

});