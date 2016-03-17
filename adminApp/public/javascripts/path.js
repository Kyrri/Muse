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
	            updateHeatmap();
	          }
	         });
	         $(this).datepicker("setDate", getLastWeek());
	        break;
	        case 1:
	         $(this).datepicker({
	          onSelect: function(date){
	            updateHeatmap();
	          }
	         });
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
				var gridX = 20;
				var gridY = 20;

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
				  var point = {
				    x: Math.floor((xAdjust*location.x)-(xAdjust/2)),
				    y: Math.floor((yAdjust*location.y)-(yAdjust/2)),
				    value: 1
				  };
				  points.push(point);
				});

				var data = { 
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