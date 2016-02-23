  google.charts.load('current', {packages: ['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart(){
  	var data = new google.visualization.DataTable();
      data.addColumn('string', 'Weekday');
      data.addColumn('number', '# Visits');
      data.addRows([
        ['Sunday', 20],
        ['Monday', 10],
        ['Tuesday', 8],
        ['Wednesday', 13],
        ['Thursday', 32],
        ['Friday', 69],
        ['Saturday', 83]
      ]);
    var options = {
      title: 'Bananas in a Bowl # Visits by Weekday',
      curveType: 'function',
      legend: { position: 'bottom' }
    }

      var chart = new google.visualization.LineChart(document.getElementById('myPieChart'));
      chart.draw(data, options);
  }
