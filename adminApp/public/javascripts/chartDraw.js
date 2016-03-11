google.charts.load('current', {packages: ['corechart']});

//Draw the analytics chart
function drawChart(column){
  //Read dynatable, use as chart data
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

   //Set options for chart (styling, column names, title, etc.)
    var options = {
      title: 'Element ' + columnName,
      curveType: 'function',
      legend: { position: 'bottom' },
      colors: ['#6baf8f']
    }
    //Draw the chart
      var chart = new google.visualization.BarChart(document.getElementById('myPieChart'));
      chart.draw(data, options);
  }


$(document).ready(function(){
  //Inject Exhibit Page
    $('.museum').on('click', function(){
        $.ajax('/exhibits',{
          type: "POST",
          dataType: 'html',             
              success: function(result) {
                if(result){
                 $('#exhibitContainer').html(result);
                 updateExhibitList();
                 drillDown();
                 $('#museums').hide();
                }
                else{
                  //wrong code, try again
                } 
            }
        });

    });

//upddtes DOM elements to incorperate injected page
  function updateExhibitList(){
    var count = 0;

    //Create Date Pickers, set default range from one week ago to current date
    $('.datePicker').each(function(){
      switch(count){
        case 0:
         $(this).datepicker();
         $(this).datepicker("setDate", getLastWeek());
        break;
        case 1:
         $(this).datepicker();
         $(this).datepicker("setDate", new Date());
         break;
      }
      count++;
    });

    //Initalize dynatable
    $('#mytable').bind('dynatable:init', function(e, dynatable){
      dynatable.queries.functions['exhibitName'] = function(record, queryValue) {
        return (record.exhibitName.toUpperCase().indexOf(queryValue.toUpperCase()) > -1);
      };
    }).dynatable({
      features:{
        search: false
      },
      inputs:{
        //Set custom search bar (can be moved wherever we want)
        queries: $('#exhibitName')
      }
    }).data('dynatable');

    //Draw chart when a table column with metrics is clicked
    $('#mytable td.metrics').on('click', function(){
      drawChart($(this).index());
    });

    //Update filters to replace base text with selected text
    $('.dropdown-menu li a').on('click', function(){
        var val = $(this).parent().parent().attr('class').split(' ')[1];
        $('#'+val).text($(this).text());
    });

    //Inject Element list page in place of Exhibit list page
      $('#mytable tbody tr').on('click', function(){
        $.ajax('/pieces',{
          type: "POST",
          dataType: 'html',             
              success: function(result) {
                if(result){
                 $('#exhibitContainer').html(result);
                 updateExhibitList();
                 drillDown();
                }
                else{
                  //wrong code, try again
                } 
            }
        });

    });
  }

  //Drills down the breadcrumbs
  function drillDown(){
    var children = $('#drillTrack li').length;
      switch(children){
        case 1:
          nextDrill = 'Exhibit';
          break;
        case 2:
          nextDrill = 'Art Elements'
          break;
        default:
          return;
          break;
      }

      $('#drillTrack').append('<li class="drill" id="'+nextDrill+'crumb"><a href="#">'+nextDrill+'</a></li>');    
  }
  //Function for datepicker to get previous week from today
  function getLastWeek(){
    var today = new Date();
    var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 7);
    return lastWeek ;
}

});

