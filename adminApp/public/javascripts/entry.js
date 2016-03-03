$(document).ready(function(){

	// PAGE VARIABLES
	var elementTagTypes = [];
	var selectedTagType = '';

	// FUNCTIONS
	// gets a list of tag types
	function getTagTypeList() {
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
				elementTagTypes = [];
				for (x in results) {
	        		//console.log(results[x]);
	        		elementTagTypes[x] = results[x].elementTagType;
	      		}
	      		//console.log(elementTagTypes);
			}
		});
	}

	// ON LOAD ITEMS
    // dynamically populate the tagTypes
  	getTagTypeList();
  	$(document).ajaxComplete(function(){
  		for (x in elementTagTypes) {
  			$('#addTagForm-elementTagType').append('<option>' + elementTagTypes[x] +'</option>')
  		}
  	});

  	// hide the addElementTag form
	$('#addTagWindow').hide();

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

	// testButton
	$('#testButton').click(function(){
		console.log(elementTagTypes);
	});
	

});