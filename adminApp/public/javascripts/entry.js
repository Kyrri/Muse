$(document).ready(function(){

	// page variables 
	var selectedTagType = '';

	// hidden form
	$('#addTagWindow').hide();

	// gets a list of tag types
	$('#tagTypeList').click(function(){
		var tagTypes = [];
		var parameters = JSON.stringify({
			'queryType': null, 
			'queryTable': 'elementTagType'
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
            		tagTypes[x] = results[x].elementTagType;
          		}

          		// display the tag types as a list
				$('#tagTypeList').html('Click tag type to select');
				$('#tagTypeList-results').empty();
				for (x in tagTypes) {
					//console.log(results[x]);
					$('#tagTypeList-results').append('<div class="tagType">'+tagTypes[x]+'</div>');
				}
			}
		})
	});

	// set a tag type variable 
	$('#tagTypeList-results').on('click','div.tagType',function(){
		$('.tagType').removeAttr('id');
		$(this).attr('id','selectedTagType');
		selectedTagType = $(this).text();
		//console.log(selectedTagType);
	});

	// select a row
	/*$('#elementList').on('click','tr',function(){
		$('tr').removeAttr('id');
		$(this).attr('id','selectedElement');
	});*/

	/*$('#addTagButton').click(function(){
		$('#addTagWindow').dialog();
	});*/


	// add element tag
	
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
				'elementTag': tag.val(),
				'elementTagType': tagType.val() 
			});	

			$.ajax('insertTag',{
				type: "POST",
				contentType: "application/json",
		 		dataType: 'JSON',
				data: params,
				success: function (results){
					//console.log(results[1][0].success);
					err = results[1][0].success
					//console.log(errCheck(err));
					if (err == 0) {
						alert(errCheck(err));
						dialog.dialog('close');
					} else {
						alert(errCheck(err));
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
	

});