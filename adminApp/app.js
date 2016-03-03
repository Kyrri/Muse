var express = require('express');
var app = require("express")();
//var routes = require('./routes');
var bodyParser = require('body-parser')
// MySQL connection
var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'muse_dev',
  multipleStatements: true
});

// Configuration
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

// Important Exports
var exports = module.exports = {};
exports.loggedIn = false;

// SQL Types
function genSqlString(queryType, queryTable){
  var sqlStr = '';
  switch(queryType) {
    default:
      sqlStr = 'SELECT * FROM ';
      break;
  }

  return sqlStr + queryTable + ';';
}

// Routes
   
  //  STARTING PAGE  //
    app.get('/:var(|index)?', function(req, res){
    	 // conn.query('CALL getElementDataFromCode('+req.body.code+',@o1, @o2, @o3,@o4,@o5,@o6,@o7); SELECT @o1, @o2, @o3,@o4,@o5,@o6,@o7', function(err, results) {
      //     if (err){
      //       console.log(err);
      //       //error occured connecting to DB
      //     }
      //     else{
      //       if(results[1][0]['@o1']==-1){
      //         console.log("Invalid Code");
      //         //Artwork doesn't exist
      //       }
      //       else{
      //         res.send(true);
      //       }
      //     }
      //   });
      res.render('index', { title: 'Muse Admin'});
    });

    //  ENTRY PAGE //
    app.get('/entry', function(req, res){
      
      //return list of elements 
      var sqlStr = 'SELECT * FROM v_elements; SELECT * FROM v_tags;';
      conn.query(sqlStr,function(err,results){
        if (err){
          console.log(err);
        } else {
          //console.log(results);
          res.render('entry', { 
            title: 'Muse Admin', 
            data: results
          });
        }
      });

    });

    app.post('/entry',function(req, res){
      var queryType = req.body.queryType;
      var queryTable = req.body.queryTable;

      // returns the element tag types, in a 1xn array
      var sqlStr = genSqlString(queryType,queryTable);
      //console.log(sqlStr);
      
      conn.query(sqlStr,function(err,results){
        if(err){
          console.log(err);
        } else {
          res.send(results);
        }
      });

    });

    app.post('/insertTag', function(req,res){
      var tag = req.body.elementTag;
      var tagType = req.body.elementTagType;

      var sqlStr = "CALL insert_elementTag('" + tag + "','" + tagType + "', @success); SELECT @success AS 'success';"

      //console.log(sqlStr);

      conn.query(sqlStr,function(err,results){
        if(err){
          console.log(err);
        } else {
          res.send(results);
        }
      });

    });



// Run Server
app.listen(3333, function(){
  console.log("Listening on 3333");
});