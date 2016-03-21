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
var squel = require('squel');

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
var museumId = null, exhibitId = null;

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
      var getTagIds = squel.select().from("elementtag").toString() + "; ";
      var fromDate = req.body.fromDate; // hard code for now, will need to be passed as a parameter
      var toDate = req.body.toDate; // hard code for now, will need to be passed as a parameter

      // truncate the ISO format, only need the date
      if (fromDate == undefined) {
        console.log("Error: fromDate undefined.");
      } else {
        fromDate = fromDate.toString().substring(0,10);
      }
      if (toDate == undefined) {
        console.log("Error: toDate undefined.");
      } else {
        toDate = toDate.toString().substring(0,10);
      }

      // hardcoding for gender
      var age = req.body.age;
      var gen = req.body.gen;
      var tagIds = req.body.tags; 
      var isage = false;
      var isgen = false;
      var istag = false;

      if (age != undefined) {
        ageClause = squel.select().from("user").field("userId").where("ageRange="+age).toString()
        ageClauseDur = squel.select().from("visit").field("visitId").where("userId IN ("+ageClause+")").toString()
        isage = true;
      } 
      if (gen != undefined) {
        genClause = squel.select().from("user").field("userId").where("gender="+gen).toString();
        genClauseDur = squel.select().from("visit").field("visitId").where("userId IN ("+genClause+")").toString()
        isgen = true;
      }
      if (tagIds != undefined) {
        var ids = "(";
        for (x in tagIds) {
          ids += tagIds[x] + ",";
        }
        ids = ids.substr(0,ids.length-1);
        ids += ")";
        tagClause = squel.select().from("elementTagMapping").field("elementId").where("elementTagId IN "+ids).toString();
        istag = true;
      }
      
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
                                              .where("e.museumId="+museumId)
                                              .group("e.exhibitId");            

        var likes = squel.select().from("v_activeelements", "e")
                                              .field("e.exhibitId")
                                              .field("COUNT(i.interactionId)", "likes")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=2")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.museumId="+museumId)
                                              .group("e.exhibitId");

        var favs = squel.select().from("v_activeelements", "e")
                                              .field("e.exhibitId")
                                              .field("COUNT(i.interactionId)", "favs")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=3")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.museumId="+museumId)
                                              .group("e.exhibitId");

        if (isgen) {
          views.where("i.userId IN ("+genClause+")");
          likes.where("i.userId IN ("+genClause+")");
          favs.where("i.userId IN ("+genClause+")");
        }
        if (isage) {
          views.where("i.userId IN ("+ageClause+")");
          likes.where("i.userId IN ("+ageClause+")");
          favs.where("i.userId IN ("+ageClause+")");
        }
        if (istag) {
          views.where("e.elementId IN ("+tagClause+")");
          likes.where("e.elementId IN ("+tagClause+")");
          favs.where("e.elementId IN ("+tagClause+")");
        }

        var aggViews = squel.select().from("v_activeexhibits", "x")
                                      .field("x.museumId")
                                      .field("x.exhibitId")
                                      .field("x.exhibitName")
                                      .field("SUM(v.views)", "views")
                                      .field("SUM(l.likes)", "likes")
                                      .field("SUM(f.favs)", "favourites")
                                      .left_join("("+views.toString()+")","v","v.exhibitId=x.exhibitId")
                                      .left_join("("+likes.toString()+")","l","l.exhibitId=x.exhibitId")
                                      .left_join("("+favs.toString()+")","f","f.exhibitId=x.exhibitId")
                                      .where("x.museumId="+museumId)
                                      .group("x.museumId")
                                      .group ("x.exhibitId")
                                      .group("x.exhibitName")
                                      .toString() + ";";
        
        //console.log('Generate QueryStr: ' + aggViews);
        //console.log('Generate QueryStr: ' + getExhibitsStr);

        var sqlStr = getAgeRangeStr + getGenderStr + getTagIds + aggViews;

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
              tags : results[2],
              exhibits : results[3]
            });
            }
            else{
              res.render('index_partial_exhibit', {
              dataType : dataType,
              exhibits : results[3]
            });
            }
          }
        });

      } else if (dataType == "element") {
        console.log("Processing element analytics ...");


        if ( req.body.exhibitId != undefined ) {
          exhibitId = req.body.exhibitId;
        } 

        var views = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "views")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=1")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId");

        var likes = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "likes")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=2")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId");

        var favs = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("COUNT(i.interactionId)", "favs")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=3")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId");

        var dur = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("AVG(i.duration)", "dur")
                                              .field("MIN(i.duration)", "mind")
                                              .field("MAX(i.duration)", "maxd")
                                              .field("STDDEV(i.duration)", "stdd")
                                              .left_join("checkInDuration", "i", "i.elementId=e.elementId")
                                              .where("i.endTime>='"+fromDate+"'")
                                              .where("i.endTime<='"+toDate+"'")
                                              .where("e.exhibitId="+exhibitId)
                                              .group("e.elementId");

        if (isgen) {
          views.where("i.userId IN ("+genClause+")");
          likes.where("i.userId IN ("+genClause+")");
          favs.where("i.userId IN ("+genClause+")");
          dur.where("i.visitId IN ("+genClauseDur+")");
        }
        if (isage) {
          views.where("i.userId IN ("+ageClause+")");
          likes.where("i.userId IN ("+ageClause+")");
          favs.where("i.userId IN ("+ageClause+")");
          dur.where("i.visitId IN ("+ageClauseDur+")");
        }
        if (istag) {
          views.where("e.elementId IN ("+tagClause+")");
          likes.where("e.elementId IN ("+tagClause+")");
          favs.where("e.elementId IN ("+tagClause+")");
          dur.where("e.elementId IN ("+tagClause+")");
        }

        var aggMetrics = squel.select().from("v_activeelements", "e")
                                      .field("e.exhibitId")
                                      .field("e.elementId")
                                      .field("e.elementName")
                                      .field("v.views", "views")
                                      .field("l.likes", "likes")
                                      .field("f.favs", "favourites")
                                      .field("FORMAT(d.dur/e.utilTime,2)", "holdingPwr")
                                      .field("FORMAT(d.dur,2)", "avgDuration")
                                      .field("FORMAT(d.mind,2)", "minDuration")
                                      .field("FORMAT(d.maxd,2)", "maxDuration")
                                      .field("FORMAT(d.stdd,2)", "stdDuration")
                                      .left_join("("+views.toString()+")","v","v.elementId=e.elementId")
                                      .left_join("("+likes.toString()+")","l","l.elementId=e.elementId")
                                      .left_join("("+favs.toString()+")","f","f.elementId=e.elementId")
                                      .left_join("("+dur.toString()+")","d","d.elementId=e.elementId")
                                      .where("e.exhibitId="+exhibitId)
                                      .group("e.exhibitId")
                                      .group ("e.elementId")
                                      .group("e.elementName")
                                      .toString() + ";";

        //console.log('Generate QueryStr: ' + aggMetrics);

        var sqlStr = getAgeRangeStr + getGenderStr + getTagIds + aggMetrics;

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
                tags : results[2],
                elements : results[3]
              });
            }
            else{
              res.render('index_partial_exhibit', {
                dataType : dataType,
                elements : results[3]
              });
            }
          }
        });

      }
    });
    app.get('/path', function(req, res){
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
               res.render('path', {
                 title:'Path Analytics',
                 museums: results
              });
          }
        });
    });
    app.post('/path', function(req, res){
      res.render('path_partial');
    });
    app.post('/pathHP', function(req, res){
      var fromDate = req.body.fromDate;
      var toDate = req.body.toDate;
       if (fromDate == undefined) {
        console.log("Error: fromDate undefined.");
      } else {
        fromDate = fromDate.toString().substring(0,10);
      }
      if (toDate == undefined) {
        console.log("Error: toDate undefined.");
      } else {
        toDate = toDate.toString().substring(0,10);
      }
      var views = squel.select().from("v_activeelements", "e")
                                              .field("e.elementId")
                                              .field("e.elementName")
                                              .field("COUNT(i.interactionId)", "views")
                                              .left_join("interaction", "i", "i.elementId=e.elementId AND i.interactionTypeId=1")
                                              .where("i.tstamp>='"+fromDate+"'")
                                              .where("i.tstamp<='"+toDate+"'")
                                              .group("e.elementId")
                                              .group("e.elementName");

        var withCode = squel.select().from("("+views.toString()+")", "e")
                                      .field("e.*")
                                      .field("l.*")
                                      .left_join("elementCode","c","c.elementId=e.elementId")
                                      .left_join("location","l","l.locationId=c.locationId");

        var sqlStr = withCode.toString();

        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log('Tried: ' + sqlStr);
            console.log(err);
          } else {
            res.send(results);
          }
        });


     // var result = [{'name': 'Crylolophosaurus','x':8, 'y': 8}, {'name': 'Native Copper', 'x':8, 'y': 10}, {'name': 'Duck-Billed Dinosaur','x':5, 'y': 5}, {'name': 'Captohinus Aguti','x':5, 'y': 8}];
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