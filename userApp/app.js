var express = require('express');
var app = require("express")();
var routes = require('./routes');
var bodyParser = require('body-parser')
var password = require('password-hash-and-salt');
var moment = require('moment');
var squelModule = require('squel');
var squel = squelModule.useFlavour('mysql');

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
var loggedIn = false;

// Routes
var prevID = null;

// Variables - Lindsay turn into cookies
var userId = null;
var visitId = null;
var elementCode = null;
  
  //  FACEBOOK LOGIN  //
    // app.get('/:var(|login)?', function(req, res){
    //   res.render('login', { title: 'LogIn'});
    // });
  //  INSECURE LOGIN/SIGNUP  //
    app.get('/:var(|login)?', function(req, res){
      if(loggedIn){
        res.redirect('/index');
      }
      else{
         res.render('login_default', { title: 'Log In'});
      }
    });

    app.post('/login', function(req,res){
      // parameters sent from the page
      var email = req.body.email;
      var passEnter = req.body.password;
      var loginType = 1; // hardcoded because we currently use only one type - email login
      
      // SQL query
      // loginPasswordReturn(in vLogin, vLoginType, vSuccess, vPass, vUserId);
      var sqlStr = "CALL loginPasswordReturn(";
      sqlStr += "'" + email + "',";
      sqlStr += loginType + ",";
      sqlStr += "@o1, @o2, @o3); SELECT @o1, @o2, @o3;";

      console.log(sqlStr);
      conn.query(sqlStr, function(err, results) {
        if (err) {
            console.log(err);
        } else {
            var success = results[1][0]['@o1'];
            if (success < 0) {
                // SQL Error
                res.send(JSON.stringify({
                    "Success": false, 
                    "ErrType": "email", 
                    "Message": "User does not exist"
                }));
            } else {
                var passCheck = results[1][0]['@o2'];
                userId = results[1][0]['@o3'];
                if (passCheck.length == 270) {
                  // hash value is valid
                  password(passEnter).verifyAgainst(passCheck, function(error, verified) {
                      if (error) {
                          //console.log("error in password verification");
                      } else if (!verified) {
                          //console.log("password is incorrect");
                          res.send(JSON.stringify({
                              "Success": false, 
                              "ErrType": "password", 
                              "Message": "Incorrect Password"
                          }));
                      } else {
                          loggedIn = true;
                          res.send(JSON.stringify({
                              "Success": true, 
                              "ErrType": null, 
                              "Message": "Login Successful",
                              "userId": userId
                          }));
                      }
                  });
                } else {
                  res.send(JSON.stringify({
                    "Success": false, 
                    "ErrType": "password", 
                    "Message": "Invalid password hash in database"
                  }));
                }
            }
        }
      });
    });

    app.get('/signup', function(req, res){
         if(loggedIn){
            res.redirect('/index');
          }
          else{
            res.render('signup_default', { title: 'Sign Up'});
         }
    });

    app.post('/signup', function(req,res){
      console.log("trying");
       password(req.body.password).hash(function(error, hash) {
        if(error){
          throw new Error('Error in hashing: ' + error);
          //PW hash failed
        }
        else{
          conn.query('CALL userCreate("'+req.body.email+'","'+hash+'",'+1+','+1+',"'+req.body.fName+'","'+req.body.lName+'",'+1+','+1+', @o1, @o2, @o3); SELECT @o1, @o2, @o3', function(err, results) {
            if (err){
              console.log(err);
              //error occured connecting to DB
            }
            else{
              if(results[1][0]['@o1']==-1){
                console.log(results[1][0]['@o2']);
                res.send(JSON.stringify({"Success": false, "ErrType": "email", "Message": results[1][0]['@o2']}));
                //User Already Exists
              }
              else{
              loggedIn = true;
              userId = results[1][0]['@o3'];
              res.send(JSON.stringify({"Success": true, "ErrType": null, "Message": "Create User Successful"}));
              }
            }
          });
        }
      });
     
    });

  //  STARTING PAGE  //
    app.get('/index', function(req, res){
      if(!loggedIn){
        res.redirect('/login');
      }
      else{
         res.render('index', { title: 'Muse' });     
      }
    });
  //  PRE VISIT  //
      app.get('/selectMuseum', function(req, res){
        if(!loggedIn){
          res.redirect('/login');
        }
        else{
          conn.query(factory.sqlGen(0).sqlStr, function (err, results) {
            //console.log(results);
            if (err) {
              console.log(err)
            } else {
              res.render('selectMuseum', { 
                title: 'Select Museum',
                data: results
              });
            }
          });
        }
      });

      app.get('/favourites', function(req, res){
        if(!loggedIn){
        res.redirect('/login');
        }
        else{
        res.render('favourites', { title: 'Favourites'});
        }
      });

      //  DURING VISIT //
      app.get('/checkIn', function(req, res){
        if(!loggedIn){
          res.redirect('/login');
        }
        else{
        res.render('checkIn', {title:'Check In'});
        }
      });
      app.post('/checkIn', function(req, res){

        var sqlParams = {"elementCode":req.body.code};
        conn.query(factory.sqlGen(2,sqlParams).sqlStr, function (err,results) {
          if (err) {
            console.log(err);
          } else {
            //console.log(results);
            if (results.length == 0) {
              // Artword does not exist
              console.log("Invalid Code");
            } else {
              res.send(true);
            }
          }
        });
      });


      app.get('/tap', function(req, res){
        if(!loggedIn){
          res.redirect('/login');
        }
        else{
        res.render('tap', { title: 'tap'});
        }
      });



      app.get('/info/', function (req, res) {
        // needed to replace wuth a url paramter, because the javascripts were not loading
        if(!loggedIn){
          res.redirect('/login');
        }
        else{
          elementCode = req.query.id;
          var sqlParams = {"elementCode":elementCode};
          conn.query(factory.sqlGen(2,sqlParams).sqlStr, function (err,results) {
            if (err) {
              console.log(err);
            } else {
              //console.log(results);
              if (results.length == 0) {
                console.log("Invalid Code");
                res.render('info', { title : 'Artwork not found', data : {
                  elementName : 'Artwork not found',
                  artist : null,
                  year : null,
                  description : null, 
                  imageLink : null}
                });
              } else {
                var now = moment.utc();
                if(prevID!==null){
                  //update previous checkin with new timestamp
                }
                //new checkin
                prevID = elementCode;
                //console.log(results[0]);
                res.render('info', { title : results[0].elementName, data : results[0] });
                // checkins interaction 
                var checkinParams = {"interactionTypeId":1, "timestamp":null};
                conn.query( factory.sqlGen(3,checkinParams).sqlStr, function (err,results) {
                  if (err) {
                    console.log(err);   
                  }
                });
              }
            }
          });
        }
      });


      app.post('/likefav', function(req, res){
        //update likes/favourites on page change
      });

      app.post('/exec_query', function (req, res) {
        conn.query(factory.sqlGen(req.body.qry, req.body.params).sqlStr, function (err, results) {
          if (err) {
            console.log(err);
          } else {
            //console.log(results);
            switch (req.body.qry) {
              case 1 :
                visitId = results[1][0]['visitId'];
                res.send(true);
                break;
              default :
                res.send(results);
                break;
            }
          }
        });
      });

//  SQL Builder Functions  //
function Factory () {
  this.sqlGen = function (queryNum,params) {
    var sqlStr;
    switch (queryNum) {
      case 0 : 
        sqlStr = new sqlGetMuseums();
        break;
      case 1 :
        sqlStr = new sqlInsertVisit(params);
        break;
      case 2 : 
        sqlStr = new sqlGetvElementDetailsByCode(params);
        break;
      case 3 :
        sqlStr = new sqlInsertInteraction(params);
        break;
      case 4 :
        sqlStr = new sqlGetRecentVisits();
        break;
    }
    //console.log(params);
    console.log('Generated Query : ' + sqlStr.sqlStr);
    return sqlStr;
  }

}

var factory = new Factory;

var sqlGetMuseums = function () {
  this.sqlStr = squel.select()
                        .from("museum")
                        .toString();
}

var sqlInsertVisit = function (params) {
  var str = "CALL insert_visit(CURDATE(),"; // default to the current date
      str += userId + ",";
      str += params.museumId + ",@o1,@o2); SELECT @o1 AS 'success', @o2 AS 'visitId';";
  this.sqlStr = str;
}

var sqlGetvElementDetailsByCode = function (params) {
  this.sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr().and("elementCode=" + params.elementCode).and("active=1"))
                        .toString();

}

var sqlInsertInteraction = function (params) {
  // grabs a bunch of data elements from the global variables
  // will fail if global variables are null because pages were skipped
  var thisElementCode = elementCode
  // remove the elementCode for visitStart and visitEnd interactions
  if ( params.interactionTypeId == 5 || params.interactionTypeId == 6 ) {
    thisElementCode = null;
  }
  var str = "CALL insert_interaction(";
      str += params.interactionTypeId + ",";
      str += userId + ",";
      str += thisElementCode + ",";
      str += visitId + ",";
      str += params.timestamp + ",@o1); SELECT @o1 AS 'success';";
  this.sqlStr = str;
}

var sqlGetRecentVisits = function (params) {
  this.sqlStr = squel.select()
                        .from('v_visits')
                        .where('userId='+userId)
                        .order('visitDate',false)
                        .limit(3)
                        .toString();
}

function testRun () {
  userId = 33;
  visitId = 4;
  var params = {'userId':userId};
  //console.log(params);
  //console.log(factory.sqlGen(3,params).sqlStr)
  conn.query(factory.sqlGen(4).sqlStr, function (err, results) {
    console.log(results);
  });
}

// Run Server
app.listen(3000, function(){
  console.log("Listening on 3000");
});


