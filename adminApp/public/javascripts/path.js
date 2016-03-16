$(document).ready(function(){
	$.ajax('/pathHP',{
      type: "POST",
      contentType : 'application/json',
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

			var heatmapInstance = h337.create({
			  container: document.getElementById('hpHeatmap'),
			  radius: radius
			});


			var points = [];
			var len = 200;

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

});