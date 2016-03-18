// Our Environment Variables //
const environment = 'qa';

var express = require('express');
var app = require("express")();
//var routes = require('./routes');
var bodyParser = require('body-parser')
//var heatmap = require('heatmap');
var fs = require('fs');
//var canvas = require('canvas');

// MySQL connection
var mysql = require('mysql');
var conn;
switch (environment) {
  case 'dev' : 
    conn = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'muse_dev',
      multipleStatements: true
    });
  break;
  case 'qa' : 
    conn = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'muse_qa',
      multipleStatements: true
    });
  break;
}
console.log('Connected to '+ environment + ' database ...');

var squel = require('squel');

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

// Global varibales 
var userId = 1; // hardcoded for now, this is the userId of the admin user
var museumId = null;

// Routes
   
  //  STARTING PAGE  //
    app.get('/:var(|index)?', function(req, res){
       var getValidMuseumsStr = squel.select().from("v_museumadminpermissions")
                                      .where("userId="+userId).toString() + ";";
        console.log('Generate QueryStr: ' + getValidMuseumsStr);

        var sqlStr = getValidMuseumsStr;

        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log('Tried: ' + sqlStr);
            console.log(err);
          } else {
            console.log('Success: ' + sqlStr);
            res.render('index', { 
              title: 'Muse Admin',
              museums : results
            });
          }
        });
    });
    app.get('/path', function(req, res){
      // var heat = heatmap(500, 500, { radius : 20 });
      // for (var i = 0; i < 200; i++) {

      //     var x = 400;
      //     var y = 20

      //     heat.addPoint(x, y);
      // }
      //   for (var i = 0; i < 10; i++) {

      //     var x = 200;
      //     var y = 20

      //     heat.addPoint(x, y);
      // }
      //   for (var i = 0; i < 5; i++) {

      //     var x = 215;
      //     var y = 20

      //     heat.addPoint(x, y);
      // }
      // heat.draw();
      // fs.writeFileSync('public/images/hpMap.png', heat.canvas.toBuffer());
      res.render('path', {
        title:'Path Analytics'
      });
    });

    //  ENTRY PAGE //
    app.get('/entry', function(req, res){
      res.render('entry', { title: 'Muse Admin' });
    });

    app.post('/index_partial', function(req, res){
      // get the data type request
      var dataType = req.body.dataType; 
      console.log("Requesting analtics for "+dataType+"...");

      // stuff that will need to be sent for all data types
      var getAgeRangeStr = squel.select().from("ageRange").toString() + "; ";
      var getGenderStr = squel.select().from("gender").toString() + "; ";
      var fromDate = req.body.fromDate; // hard code for now, will need to be passed as a parameter
      var toDate = req.body.ToDate; // hard code for now, will need to be passed as a parameter

      if (dataType == "exhibit") {
        console.log("Processing exhibit analytics ...");

        if ( req.body.museumId != undefined ) {
          museumId = req.body.museumId;
        } 
       
        var views = squel.select().from("v_activeelements", "e")
                                              .field("e.exhibitId")
                                              .field("COUNT(i.interactionId)", "views")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=1")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("museumId="+museumId)
                                              .group("e.exhibitId")
                                              .toString();

        var likes = squel.select().from("v_activeelements", "e")
                                              .field("e.exhibitId")
                                              .field("COUNT(i.interactionId)", "likes")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=2")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("museumId="+museumId)
                                              .group("e.exhibitId")
                                              .toString();

        var favs = squel.select().from("v_activeelements", "e")
                                              .field("e.exhibitId")
                                              .field("COUNT(i.interactionId)", "favs")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=3")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("museumId="+museumId)
                                              .group("e.exhibitId")
                                              .toString();

        var aggViews = squel.select().from("v_activeexhibits", "x")
                                      .field("x.museumId")
                                      .field("x.exhibitId")
                                      .field("x.exhibitName")
                                      .field("SUM(v.views)", "views")
                                      .field("SUM(l.likes)", "likes")
                                      .field("SUM(f.favs)", "favourites")
                                      .left_join("("+views+")","v","v.exhibitId=x.exhibitId")
                                      .left_join("("+likes+")","l","l.exhibitId=x.exhibitId")
                                      .left_join("("+favs+")","f","f.exhibitId=x.exhibitId")
                                      .where("museumId="+museumId)
                                      .group("x.museumId")
                                      .group ("x.exhibitId")
                                      .group("x.exhibitName")
                                      .toString() + ";";
        
        //console.log('Generate QueryStr: ' + aggViews);
        //console.log('Generate QueryStr: ' + getExhibitsStr);

        var sqlStr = getAgeRangeStr + getGenderStr + aggViews;

        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log('Tried: ' + sqlStr);
            console.log(err);
          } else {
            //console.log('Success: ' + sqlStr);
            if(req.body.reload){
              res.render('index_partial', {
              dataType : dataType,
              ageRange : results[0],
              gender : results[1],
              exhibits : results[2]
            });
            }
            else{
              res.render('index_partial_exhibit', {
              dataType : dataType,
              ageRange : results[0],
              gender : results[1],
              exhibits : results[2]
            });
            }
          }
        });

      } else if (dataType == "element") {
        console.log("Processing element analytics ...");

        var exhibitId = req.body.exhibitId;

        var views = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "views")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=1")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId")
                                              .toString();

        var likes = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "likes")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=2")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId")
                                              .toString();

        var favs = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "favs")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=3")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId")
                                              .toString();

        var dur = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("AVG(i.duration)", "dur")
                                              .left_join("checkInDuration", "i", "i.elementId=e.elementId")
                                              .where("i.endTime>='"+fromDate+"'")
                                              .where("i.endTime<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId")
                                              .toString();

        var aggMetrics = squel.select().from("v_activeelements", "e")
                                      .field("e.exhibitId")
                                      .field("e.elementId")
                                      .field("e.elementName")
                                      .field("v.views", "views")
                                      .field("l.likes", "likes")
                                      .field("f.favs", "favourites")
                                      .field("d.dur/e.utilTime", "holdingPwr")
                                      .left_join("("+views+")","v","v.elementId=e.elementId")
                                      .left_join("("+likes+")","l","l.elementId=e.elementId")
                                      .left_join("("+favs+")","f","f.elementId=e.elementId")
                                      .left_join("("+dur+")","d","d.elementId=e.elementId")
                                      .where("e.exhibitId="+exhibitId)
                                      .group("e.exhibitId")
                                      .group ("e.elementId")
                                      .group("e.elementName")
                                      .toString() + ";";

        //console.log('Generate QueryStr: ' + aggMetrics);

        var sqlStr = getAgeRangeStr + getGenderStr + aggMetrics;

        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log('Tried: ' + sqlStr);
            console.log(err);
          } else {
            //console.log('Success: ' + sqlStr);
            if(req.body.reload){
              res.render('index_partial', {
                dataType : dataType,
                ageRange : results[0],
                gender : results[1],
                elements : results[2]
              });
            }
            else{
              res.render('index_partial_exhibit', {
                dataType : dataType,
                ageRange : results[0],
                gender : results[1],
                elements : results[2]
              });
            }
          }
        });

      }
    });

    app.post('/exec_sp',function(req,res){
      // this is a general call that will execute any sp with parameters in the form:
      /*  
          var params = JSON.stringify({
          'sp' : 'insert_elementTag',     // the name of the SP, exactly as in the db
          'input_params' : {              // the values of the input parameters, name of key does not mater
            'i1' : 'Automotive',          // number of input parameters in emebeded JSON must match number in SP definition
            'i2' : 'Industry'
          },
          'output_params' : 1             // the number of output parameters
          });
      */     

      var sp = req.body.sp;
      var input_params = req.body.input_params;
      var output_params = req.body.output_params;
      var sqlStr = "CALL "

      sqlStr += sp + "('";
      for (x in input_params) {
        sqlStr += input_params[x] + "','"
      }
      sqlStr = sqlStr.substring(0, sqlStr.length - 1); //remove the last ', output vars dont need it

      for (i=1;i<=output_params;i++) {
        sqlStr += "@o" + i + ",";
      }
      sqlStr = sqlStr.substring(0, sqlStr.length - 1);
      sqlStr +=  "); ";
      
      sqlStr += "SELECT ";
      for (i=1;i<=output_params;i++) {
          sqlStr += "@o" + i + ",";
      }
      sqlStr = sqlStr.substring(0, sqlStr.length - 1) + ";";

      console.log(sqlStr);

      conn.query(sqlStr,function(err,results){
        if(err){
          console.log(err);
        } else {
          res.send(results);
        }
      });

    });

    app.post('/exec_qry',function(req,res){
      // this is a general call that will execute an query with/without where clauses with parameters in the form:
      /*
          var params = JSON.stringify({
              'table' : 'museum'          // if no clauses, do not include clauses
          });

          var params = JSON.stringify({
              'table' : 'exhibit',
              'clauses' : {
                'musuemId' : "'f_getMuseumId(' + museum + ')'" // make sure to send strings with quotes - ''
              }
          });
      */
      var table = req.body.table;
      var clauses = req.body.clauses;

      var sqlStr = "SELECT * FROM ";

      sqlStr += table;

      if (clauses != null) {
        sqlStr += " WHERE ";
        for (x in clauses) {
          sqlStr += x + "=" + clauses[x] + " AND ";
        }
        sqlStr = sqlStr.substring(0, sqlStr.length - 5);
      }
      sqlStr += ";";
      
      console.log(sqlStr);

      conn.query(sqlStr,function(err,results){
        if(err){
          console.log(err);
        } else {
          res.send(results);
        }
      });

    });

    app.post('/exec_qryFields',function(req,res){
      var table = req.body.table;
      var sqlStr = "SHOW COLuMNS FROM " + table + ";";
      console.log(sqlStr);
      conn.query(sqlStr,function(err,results){
        if(err){
          console.log(err);
          res.send(err);
        } else {
          res.send(results);
        }
      });
    });

// Run Server
app.listen(3333, function(){
  console.log("Listening on 3333 ...");
});