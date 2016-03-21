$(document).ready(function(){
	createDatePickers();

	//Map Constants
	var gridX = 0;
	var gridY = 0;

	//Select Museum
	$('.museum').on('click', function(){
		var mus = $(this).val();
		  $.ajax('/path',{
	      type: "POST",
	      dataType: 'html',
	      success: function(results){
	      	$('#partialContainer').html(results);
	      		updateMap(mus);
	      	if(gridX!=0 && gridY!=0){
				updateHeatMap();
	      	}
	      	else{
	      		$('#partialContainer').html("<p>No Valid Map</p>");
	      	}
	      }
	    });
	});

	//Pick map and variables based on current museum map 

	// SET GRID SIZE AND MAP LINKS HERE!!! //
	function updateMap(musID){
		var img = new Image();
			img.onload = function(){
			  var height = img.height;
			  var width = img.width;
			  $('#hpMapCanvas').attr('width', width);
			  $('#hpMapCanvas').attr('height', height);
			}
		switch(parseInt(musID)){
			//Sample Museum
			case 1:
				gridX = 12;
				gridY = 9;
				$('canvas').css({'background':'url(images/bigDemoMap.jpg)'});
				img.src = 'images/bigDemoMap.jpg';
				break;
			//Symposium
			case 2:
				break;
			//Doesn't Have a Map
			default:
				gridX = 0;
				gridY = 0;
				break;
		}
	}

	//Creates the Datepickers Filters
	function createDatePickers(){
	    var count = 0;

	     $('.datePicker').each(function(){
		      switch(count){
		        case 0:
		         $(this).datepicker({
		          onSelect: function(date){
		            $("#date_2").datepicker("option","minDate", date);
	            	if($('#hpHeatMap').length){
	            	 	updateHeatmap();
	            	}
		          }
		         });
		         $(this).datepicker("option","maxDate", new Date());
		         $(this).datepicker("setDate", getLastWeek());
		        break;
		        case 1:
		         $(this).datepicker({
		          onSelect: function(date){
		            $("#date_1").datepicker("option","maxDate", date);
		            if($('#hpHeatMap').length){
		           		 updateHeatmap();
		           	}
		          }
		         });
		         $(this).datepicker("option","minDate", new getLastWeek());
		         $(this).datepicker("setDate", new Date());
		         break;
		      }
		      count++;
		    });
	  }
	//updates the Heatmap
	function updateHeatmap(){
		var count = 0;
		var toDate;
		var fromDate;
		var params;

		$('.datePicker').each(function(){
	        switch(count){
	          case 0:
	           fromDate = $(this).datepicker("getDate");
	          break;
	          case 1:
	           toDate = $(this).datepicker("getDate");
	           break;
	        }
	        count++;
      	});

    	params = JSON.stringify({ 
          'toDate'   : toDate,
          'fromDate' : fromDate
        });


		$.ajax('/pathHP',{
	      type: "POST",
	      contentType : 'application/json',
	      data: params,
	      dataType: 'json',
	        success: function(result) {
	        	//Number of squares x-y on museum layout grid
				var max = 0;

				//width and height of canvas element
				var width = $('#hpMapCanvas').attr('width');
				var height = $('#hpMapCanvas').attr('height');
				//coordinate adjustment to line up museum grid coordinates to heatMap coordinates
				var xAdjust = (width/gridX);
				var yAdjust = (height/gridY);

				//Make heatmap dot radius based on lesser grid coordinate, with slight overlap
				var radius = Math.floor(Math.min(xAdjust+1, yAdjust+1));
	
				//Create Heatmap

				var heatmapInstance = h337.create({
				  container: document.getElementById('hpHeatMap'),
				  radius: radius
				});

				var trackToolTip = [];
				var points = [];
					result.forEach(function(location){
						if(location.gridX!=null && location.gridY!=null){
							var val = location.views;

							max = Math.max(max, val);
						  	var point = {
						  		x: Math.floor((yAdjust*location.gridX)+(yAdjust/2)),
							    y: Math.floor((xAdjust*location.gridY)+(xAdjust/2)),
							    value: val
						 	};
						 	var tip = {
						 		x: location.gridX,
						 		y: location.gridY,
						 		value: val,
						 		element: location.elementName
						 	};
						  points.push(point);
						  trackToolTip.push(tip);
						}
					});

				var data = { 
				  max: max,
				  data: points 
				};
				heatmapInstance.setData(data);

				$('#hpHeatMap').on('mousemove', function(evt){
					var xMouse = evt.pageX - $('#hpMapCanvas').offset().left;
					var yMouse = evt.pageY - $('#hpMapCanvas').offset().top;
					var x = Math.floor(xMouse/xAdjust);
					var y = Math.floor(yMouse/yAdjust);
					var noMatch = true;
					if(trackToolTip.length>0){
						for(var i=0; i<trackToolTip.length; i++){
							if(trackToolTip[i].x==x && trackToolTip[i].y==y){
								$('#tooltip').text(trackToolTip[i].element+": "+trackToolTip[i].value);
								$('#tooltip').css({left:evt.pageX, top:evt.pageY});
								if(!$('#tooltip').is(':visible')){
									$('#tooltip').show();
								}
								noMatch = false;
								break;
							}
						}
					}
					if(noMatch){
						if($('#tooltip').is(':visible')){
							$('#tooltip').hide();
						}
					}
				});

	        }

	    });
	}

		//get previous week
	function getLastWeek(){
	    var today = new Date();
	    var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 7);
	    return lastWeek ;
  	}

});