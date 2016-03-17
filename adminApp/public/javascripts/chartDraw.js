google.charts.load('current', {packages: ['corechart']});
var tableContainer = '#exhibitTable';
//id of current museum
var musID;
var exID;
var dataType;
var reload = true;

//Draw the analytics chart
function drawChart(column){
  //Read dynatable, use as chart data
  var columnName = $(tableContainer).find('table thead tr td:nth-child('+(column+1)+')').text();
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Title');
    data.addColumn('number', columnName);
    var totalrows = [];
    $('table tbody', tableContainer).find('tr').each(function(){
      var row = [];
      row.push($(this).find('td:nth-child(1)').text());
      row.push(parseFloat($(this).find('td:nth-child('+(column+1)+')').text()));
      totalrows.push(row);
    });
   data.addRows(totalrows);

   //Set options for chart (styling, column names, title, etc.)
    var options = {
      title: columnName,
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
    var museumId = $(this).val();
    musID = museumId;
    dataType = 'exhibit';
    updateTable(true);
    $('#museums').hide();
  });

//upddtes DOM elements to incorperate injected page
  function createDatePickers(){
    var count = 0;

    $('.datePicker').each(function(){
      switch(count){
        case 0:
         $(this).datepicker({
          onSelect: function(date){
            updateTable(false);
          }
         });
         $(this).datepicker("setDate", getLastWeek());
        break;
        case 1:
         $(this).datepicker({
          onSelect: function(date){
            updateTable(false);
          }
         });
         $(this).datepicker("setDate", new Date());
         break;
      }
      count++;
    });
  }

  function updateExhibitList(){
     function myRowWriter(rowIndex, record, columns, cellWriter) {
        var tr = '';

        // grab the record's attribute for each column
        for (var i = 0, len = columns.length; i < len; i++) {
          tr += cellWriter(columns[i], record);
        }

        return '<tr id=' + record.customData + '>' + tr + '</tr>';
      };

      function myRowReader(rowIndex, rowElement, record) {
        record.customData = $(rowElement).attr('id');
      };

    //Initalize dynatable
    $(tableContainer+ ' table').bind('dynatable:init', function(e, dynatable){
      dynatable.queries.functions['exhibitName'] = function(record, queryValue) {
        return (record.exhibitName.toUpperCase().indexOf(queryValue.toUpperCase()) > -1);
      };
    }).dynatable({
      features:{
        search: false
      },
     writers: {
        _rowWriter: myRowWriter
      },
      readers: {
        _rowReader: myRowReader
      },
      inputs:{
        //Set custom search bar (can be moved wherever we want)
        queries: $('#exhibitName')
      }
    }).data('dynatable');
    drawChart(1);

    //Draw chart when a table column with metrics is clicked
    $(tableContainer+' table td.metrics').on('click', function(){
      drawChart($(this).index());
    });

    //Update filters to replace base text with selected text
    $('.dropdown-menu li a').on('click', function(){
        var val = $(this).parent().parent().attr('class').split(' ')[1];
        $('#'+val).text($(this).text());
    });

    //Inject Element list page in place of Exhibit list page
    $(tableContainer+' table tbody tr').on('click', function(){
      alert();
      var exhibitId = $(this).attr('id');
      exID = exhibitId;
      dataType = 'element';
      updateTable(true);
    });

  }

  //Creates/uploads the analytics table
  function updateTable(drilldown){
    var params;
    var toDate;
    var fromDate;
    var id;
    if(dataType=='exhibit'){
      id=musID;
    }
    else if(dataType=='element'){
      id=exID;
    }
    var count = 0;
    if($('.datePicker').length){
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
    }
    else{
      fromDate = getLastWeek();
      toDate = new Date();
    }
    switch (dataType) {
      case 'exhibit' :
        params = JSON.stringify({ 
          'dataType' : dataType, 
          'museumId' : id, 
          'toDate'   : toDate,
          'fromDate' : fromDate,
          'reload'   : reload
        });
      break;
      case 'element' :
        params = JSON.stringify({ 
          'dataType' : dataType, 
          'exhibitId': id,
          'toDate'   : toDate,
          'fromDate' : fromDate,
          'reload'   : reload
        });
      break;
    }

    //console.log(params);
    $.ajax('/index_partial',{
      type: "POST",
      contentType : 'application/json',
      data: params,
      dataType: 'html',
        success: function(result) {
          if(result){
            if(reload){
              $('#exhibitContainer').html(result);
              createDatePickers();
              reload=false;
            }
           else{
            $(tableContainer).html(result);
           }
           updateExhibitList();  
          
           if(drilldown){
              drillDown();
           }           
          }
          else{
            //wrong code, try again
          } 
      }
    });
  }

  //Drills down the breadcrumbs
  function drillDown(){
    var children = $('#drillTrack li').length;
    var nextDrill;
    var idName;
      switch(children){
        case 1:
          nextDrill = 'Exhibit';
          idName = 'exhibitCrumb';
          break;
        case 2:
          nextDrill = 'Art Elements'
          idName = 'elementCrumb';
          break;
        default:
          return;
          break;
      }
      $('#drillTrack').append('<li class="drill" id="'+idName+'"><a href="#">'+nextDrill+'</a></li>');   
      wrapCrumbs(); 
  }
  //Updates DOM with event handlers for breadCrumbs
  function wrapCrumbs(){
   //Drill Up Breadcrumbs
  $('#drillTrack li').on('click', function(){
      var children = $('#drillTrack li').length;
      var i;
      if($(this).attr("id")==='museumCrumb'){
        i=1;
        $('#exhibitContainer').html("");
        reload=true;
        $('#museums').show();
      }
      else if($(this).attr("id")==='exhibitCrumb'){
        i=2;
        dataType = 'exhibit';
        updateTable(false);
      }
      for(i; i<children; i++){
        $('#drillTrack li').remove(':last-child');
      }
    });
  }
  //Function for datepicker to get previous week from today
  function getLastWeek(){
    var today = new Date();
    var lastWeek = new Date(today.getFullYear(), today.getMonth(), today.getDate() - 7);
    return lastWeek ;
  }

});

