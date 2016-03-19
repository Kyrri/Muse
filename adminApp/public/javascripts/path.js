$(document).ready(function(){
	createDatePickers();
	updateHeatmap();

	//Creates the Datepickers Filters
	function createDatePickers(){
	    var count = 0;

	     $('.datePicker').each(function(){
		      switch(count){
		        case 0:
		         $(this).datepicker({
		          onSelect: function(date){
		            $("#date_2").datepicker("option","minDate", date);
		            updateTable(false);
		          }
		         });
		         $(this).datepicker("option","maxDate", new Date());
		         $(this).datepicker("setDate", getLastWeek());
		        break;
		        case 1:
		         $(this).datepicker({
		          onSelect: function(date){
		            $("#date_1").datepicker("option","maxDate", date);
		            updateTable(false);
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
				var gridX = 12;
				var gridY = 9;
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

						  points.push(point);
						}
					});

				var data = { 
				  max: max,
				  data: points 
				};

				heatmapInstance.setData(data);

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