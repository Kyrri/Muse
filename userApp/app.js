// Our Environment Variables //
const environment = 'qa';

var express = require('express');
var app = require("express")();
var routes = require('./routes');
var bodyParser = require('body-parser')
var password = require('password-hash-and-salt');
var moment = require('moment');
var squelModule = require('squel');
var squel = squelModule.useFlavour('mysql');
var cookieParser = require('cookie-parser');
var expressSession = require('express-session');
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

// Configuration
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(cookieParser());
app.use(expressSession({secret:"secretText"}));



// Variables - Lindsay turn into cookies
  
  //  FACEBOOK LOGIN  //
    // app.get('/:var(|login)?', function(req, res){
    //   res.render('login', { title: 'LogIn'});
    // });
  //  INSECURE LOGIN/SIGNUP  //
    app.get('/:var(|login)?', function(req, res){
      if(req.session.loggedIn){
        res.redirect('/index');
      }
      else{
         res.render('login_default', { title: 'Log In'});
      }
    });

    app.post('/login', function(req,res){
      // parameters sent from the page
      var email = escapeRegExp(req.body.email);
      var passEnter = req.body.password;
      var loginType = 1; // hardcoded because we currently use only one type - email login
      
      // SQL query
      // loginPasswordReturn(in vLogin, vLoginType, vSuccess, vPass, vUserId);
      var sqlStr = "CALL loginPasswordReturn(";
      sqlStr += "'" + email + "',";
      sqlStr += loginType + ",";
      sqlStr += "@o1, @o2, @o3); SELECT @o1, @o2, @o3;";

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
                req.session.userId = results[1][0]['@o3'];
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
                          req.session.loggedIn = true;
                          res.send(JSON.stringify({
                              "Success": true, 
                              "ErrType": null, 
                              "Message": "Login Successful",
                              "userId": req.session.userId
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
      if (req.session.loggedIn) {
        res.redirect('/index');
      } else {
        var ageRangeQuery = squel.select().from("ageRange").toString() + ";";
        var genderQuery = squel.select().from("gender").toString() + ";";
        var sqlStr = ageRangeQuery + genderQuery;
        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log(err);
            res.redirect('/signup');
          } else {
            //console.log(results);
            res.render('signup_default', { 
              title: 'Sign Up',
              ageRange : results[0],
              gender : results[1]
            });
          }
        }); 
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
          var email = escapeRegExp(req.body.email);
          var fName = escapeRegExp(req.body.fName);
          var lName = escapeRegExp(req.body.lName);
          var sqlStr = 'CALL userCreate("'+email+'","'+hash+'",'+1+','+1+',"'+fName+'","'+lName+'",'+req.body.gender+','+req.body.age+', @o1, @o2, @o3); SELECT @o1, @o2, @o3;';
          conn.query(sqlStr, function(err, results) {
            if (err){
              console.log('Query Failed: '+sqlStr);
              console.log(err);
              res.send(JSON.stringify({"Success": false, "ErrType": "sql", "Message": "Database could not process request"}));
              //error occured connecting to DB
            }
            else{
              if(results[1][0]['@o1']==-1){
                console.log(results[1][0]['@o2']);
                res.send(JSON.stringify({"Success": false, "ErrType": "email", "Message": results[1][0]['@o2']}));
                //User Already Exists
              }
              else{
              req.session.loggedIn = true;
              req.session.userId = results[1][0]['@o3'];
              res.send(JSON.stringify({"Success": true, "ErrType": null, "Message": "Create User Successful"}));
              }
            }
          });
        }
      });
     
    });
    app.get('/logout', function(req, res){
      req.clearCookie('loggedIn');
      req.clearCookie('userId');
      req.clearCookie('firstName');
      console.log(req.session);
    });

  // //  STARTING PAGE  //
    app.get('/index', function(req, res){
      if(!req.session.loggedIn){
        res.redirect('/login');
      }
      else{
         res.render('index', { 
          title: 'Muse'
        });     
      }
    });

  // //  PRE VISIT  //
      app.get('/selectMuseum', function(req, res){
        if(!req.session.loggedIn){
          res.redirect('/login');
        }
        else{
            var sqlStr = squel.select()
                        .from("museum")
                        .toString();
          conn.query(sqlStr, function (err, results) {
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
      app.post('/index', function(req, res){
        var firstName;
         if(req.session.firstName){
            var sqlStr = "SELECT firstName FROM user WHERE userId='"+req.session.userId+"'";
            conn.query(sqlStr, function(err, results) {
              if (err) {
                  console.log(err);
              } else {
                req.session.firstName = results[0].firstName;
                firstName = results[0].firstName;
              }
              });
          }
          else{
            firstName = req.session.firstName;
          }
          res.send(firstName);
      });

      app.get('/favourites', function(req, res){
        if(!req.session.loggedIn){
        res.redirect('/login');
        }
        else{
        res.render('favourites', { title: 'Favourites'});
        }
      });

      //  DURING VISIT //
      app.get('/checkIn', function(req, res){
        if(!req.session.loggedIn){
          res.redirect('/login');
        }
        else{
        res.render('checkIn', {title:'Check In'});
        }
      });

      app.post('/checkIn', function(req, res){

        var params = {"elementCode":req.body.code};
        req.session.elementCode = req.body.code;

        var sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr()
                          .and("elementCode=" + params.elementCode)
                          .and("active=1")
                          .and("museumId=" + req.session.museumId)
                        )
                        .toString();
        conn.query(sqlStr, function (err,results) {
          if (err) {
            console.log(err);
          } else {
            //console.log(results);
            if (results.length == 0) {
              // Artword does not exist
              console.log("Invalid Code");
              res.send(false);
            } else {
              res.send(true);
            }
          }
        });
      });


      app.get('/tap', function(req, res){
        if(!req.session.loggedIn){
          res.redirect('/login');
        }
        else{
        res.render('tap', { title: 'tap'});
        }
      });

      app.get('/info/', function (req, res) {
        // needed to replace wuth a url paramter, because the javascripts were not loading
        if(!req.session.loggedIn){
          res.redirect('/login');
        }
        else{
          req.session.elementCode= req.query.id;
          var elementCode = req.query.id;
          var params = {"elementCode":elementCode};
           var sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr()
                          .and("elementCode=" + params.elementCode)
                          .and("active=1")
                          .and("museumId=" + req.session.museumId)
                        )
                        .toString();
          conn.query(sqlStr, function (err,results) {
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
                if(req.session.prevID){
                  //update previous checkin with new timestamp
                }
                //new checkin
                req.session.prevID = elementCode;
                //console.log(results[0]);
                res.render('info', { title : results[0].elementName, data : results[0] });
                // checkins interaction 
                var params = {"interactionTypeId":1, "timestamp":null};

                var thisElementCode = req.session.elementCode;
                  // remove the elementCode for visitStart and visitEnd interactions
                  if ( params.interactionTypeId == 5 || params.interactionTypeId == 6 ) {
                    thisElementCode = null;
                  }
                  var str = "CALL insert_interaction(";
                      str += params.interactionTypeId + ",";
                      str += req.session.userId + ",";
                      str += thisElementCode + ",";
                      str += req.session.visitId + ",";
                      str += params.timestamp + ",@o1); SELECT @o1 AS 'success';";
                  var sqlStr = str;
                conn.query(sqlStr, function (err,results) {
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
        var sqlStr;
        var params = req.body.params;
        switch(req.body.qry){
          case 0:
           sqlStr = squel.select()
                        .from("museum")
                        .toString();
                        break;
          case 1:
              req.session.museumId = params.museumId;
          var str = "CALL insert_visit(CURDATE(),"; // default to the current date
          str += req.session.userId + ",";
          str += params.museumId + ",null,@o1,@o2); SELECT @o1 AS 'success', @o2 AS 'visitId';";

            sqlStr = str;
            break;
          case 2:
            sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr()
                          .and("elementCode=" + params.elementCode)
                          .and("active=1")
                          .and("museumId=" + req.session.museumId)
                        )
                        .toString();
          case 3:
            var thisElementCode = req.session.elementCode;
  // remove the elementCode for visitStart and visitEnd interactions
  if ( params.interactionTypeId == 5 || params.interactionTypeId == 6 ) {
    thisElementCode = null;
  }
  var str = "CALL insert_interaction(";
      str += params.interactionTypeId + ",";
      str += req.session.userId + ",";
      str += thisElementCode + ",";
      str += req.session.visitId + ",";
      str += params.times
      sqlstr = str;
      break;
          case 4:
            sqlStr = squel.select()
                        .from('v_visits')
                        .where('userId='+req.session.userId)
                        .order('visitDate',false)
                        .limit(3)
                        .toString();
                        break;
        }

        conn.query(sqlStr, function (err, results) {
          if (err) {
            console.log(err);
          } else {
            //console.log(results);
            switch (req.body.qry) {
              case 1 :
                req.session.visitId = results[1][0]['visitId'];
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
  this.sqlGen = function (queryNum,params, req) {
    var sqlStr;
    switch (queryNum) {
      case 0 : 
        sqlStr = new sqlGetMuseums();
        break;
      case 1 :
        sqlStr = new sqlInsertVisit(params, req);
        break;
      case 2 : 
        sqlStr = new sqlGetvElementDetailsByCode(params, req);
        break;
      case 3 :
        sqlStr = new sqlInsertInteraction(params, req);
        break;
      case 4 :
        sqlStr = new sqlGetRecentVisits(req);
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

var sqlInsertVisit = function (params, req) {
  req.session.museumId = params.museumId;
  var str = "CALL insert_visit(CURDATE(),"; // default to the current date
      str += req.session.userId + ",";
      str += params.museumId + ",null,@o1,@o2); SELECT @o1 AS 'success', @o2 AS 'visitId';";

  this.sqlStr = str;
}

var sqlGetvElementDetailsByCode = function (params, req) {
  this.sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr()
                          .and("elementCode=" + params.elementCode)
                          .and("active=1")
                          .and("museumId=" + req.session.museumId)
                        )
                        .toString();

}

var sqlInsertInteraction = function (params, req) {
  // grabs a bunch of data elements from the global variables
  // will fail if global variables are null because pages were skipped
  var thisElementCode = req.session.elementCode;
  // remove the elementCode for visitStart and visitEnd interactions
  if ( params.interactionTypeId == 5 || params.interactionTypeId == 6 ) {
    thisElementCode = null;
  }
  var str = "CALL insert_interaction(";
      str += params.interactionTypeId + ",";
      str += req.session.userId + ",";
      str += thisElementCode + ",";
      str += req.session.visitId + ",";
      str += params.timestamp + ",@o1); SELECT @o1 AS 'success';";
  this.sqlStr = str;
}

var sqlGetRecentVisits = function (params, req) {

  this.sqlStr = squel.select()
                        .from('v_visits')
                        .where('userId='+req.session.userId)
                        .order('visitDate',false)
                        .limit(3)
                        .toString();
}

// function testRun () {
//   req.cookie('userId', 33);
//   visitId = 4;
//   var params = {'userId':req.cookie.userId};
//   //console.log(params);
//   //console.log(factory.sqlGen(3,params).sqlStr)
//   conn.query(factory.sqlGen(4).sqlStr, function (err, results) {
//     console.log(results);
//   });
// }
function escapeRegExp(str) {
  return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
        switch (char) {
            case "\0":
                return "\\0";
            case "\x08":
                return "\\b";
            case "\x09":
                return "\\t";
            case "\x1a":
                return "\\z";
            case "\n":
                return "\\n";
            case "\r":
                return "\\r";
            case "\"":
            case "'":
            case "\\":
            case "%":
                return "\\"+char; // prepends a backslash to backslash, percent,
                                  // and double/single quotes
        }
    });
}

// Run Server
app.listen(3000, function(){
  console.log("Listening on 3000 ...");
});


