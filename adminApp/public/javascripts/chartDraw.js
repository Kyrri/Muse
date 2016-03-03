google.charts.load('current', {packages: ['corechart']});

function drawChart(column){
  var columnName = $('#mytable').find('thead tr td:nth-child('+(column+1)+')').text().slice(0,-2);
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Title');
    data.addColumn('number', columnName);
    var totalrows = [];
    $('tbody', '#mytable').find('tr').each(function(){
      var row = [];
      row.push($(this).find('td:nth-child(1)').text());
      row.push(parseFloat($(this).find('td:nth-child('+(column+1)+')').text()));
      totalrows.push(row);
    });
   data.addRows(totalrows);
    var options = {
      title: columnName +' for Elements',
      curveType: 'function',
      legend: { position: 'bottom' }
    }

      var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
      chart.draw(data, options);
  }


$(document).ready(function(){
  $('.datePicker').datepicker();
  $('#mytable').bind('dynatable:init', function(e, dynatable){
    dynatable.queries.functions['exhibitName'] = function(record, queryValue) {
      return (record.exhibitName.toUpperCase().indexOf(queryValue.toUpperCase()) > -1);
    };
  }).dynatable({
    features:{
      search: false
    },
    inputs:{
      queries: $('#exhibitName')
    }
  }).data('dynatable');

  $('#mytable td.metrics').on('click', function(){
    drawChart($(this).index());
  });
  $('.dropdown-menu li a').on('click', function(){
      var val = $(this).parent().parent().attr('class').split(' ')[1];
      $('#'+val).text($(this).text());
  });


});

