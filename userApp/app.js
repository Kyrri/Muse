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
var exports = module.exports = {};
exports.loggedIn = false;

// Routes
var prevID = null;

// Variables - Lindsay turn into cookies
var userId = null;
var visitId = null;
  
  //  FACEBOOK LOGIN  //
    // app.get('/:var(|login)?', function(req, res){
    //   res.render('login', { title: 'LogIn'});
    // });
  //  INSECURE LOGIN/SIGNUP  //
    app.get('/:var(|login)?', function(req, res){
      res.render('login_default', { title: 'Log In'});
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
      res.render('signup_default', { title: 'Sign Up'});
    });
    app.post('/signup', function(req,res){
      console.log("trying");
       password(req.body.password).hash(function(error, hash) {
        if(error){
          throw new Error('Error in hashing: ' + error);
          //PW hash failed
        }
        else{
          conn.query('CALL userCreate("'+req.body.email+'","'+hash+'",'+1+','+1+',"'+req.body.fName+'","'+req.body.lName+'",'+1+','+1+', @o1, @o2); SELECT @o1, @o2', function(err, results) {
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
              res.send(JSON.stringify({"Success": true, "ErrType": null, "Message": "Create User Successful"}));
              }
            }
          });
        }
      });
     
    });

  //  STARTING PAGE  //
    app.get('/index', function(req, res){
      res.render('index', { title: 'Muse'});
    });
    // app.get('/artInfo', function(req, res){
    //    res.render('artInfo', { title: 'Art Info'});
    // });

  //  PRE VISIT  //
      app.get('/selectMuseum', function(req, res){
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
      });
      app.get('/selectPlanType', function(req, res){
        res.render('selectPlanType', { title: 'Select Plan Type'});
      });
      app.get('/beginTour', function(req, res){
        res.render('beginTour', { title: 'Begin Tour'});
      });
      app.get('/favourites', function(req, res){
        res.render('favourites', { title: 'Favourites'});
      })

      //  DURING VISIT //
      app.get('/checkIn', function(req, res){
        res.render('checkIn', {title:'Check In'});
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
        
        /* Lindsay's Old Code
        conn.query('CALL getElementDataFromCode('+req.body.code+',@o1, @o2, @o3,@o4,@o5,@o6,@o7); SELECT @o1, @o2, @o3,@o4,@o5,@o6,@o7', function(err, results) {
          if (err){
            console.log(err);
            //error occured connecting to DB
          }
          else{
            if(results[1][0]['@o1']==-1){
              console.log("Invalid Code");
              //Artwork doesn't exist
            }
            else{
              res.send(true);
            }
          }
        });
        */
      });


      app.get('/tap', function(req, res){
        res.render('tap', { title: 'tap'});
      });



      app.get('/info/', function (req, res) {
        // needed to replace wuth a url paramter, because the javascripts were not loading
        var sqlParams = {"elementCode":req.query.id};
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
              prevID = req.params.id;
              //console.log(results[0]);
              res.render('info', { title : results[0].elementName, data : results[0] });
            }
          }
        });
        
        /* Lindsay's Old Code
        conn.query('CALL getElementDataFromCode('+req.params.id+',@o1, @o2, @o3,@o4,@o5,@o6,@o7); SELECT @o1, @o2, @o3,@o4,@o5,@o6,@o7', function(err, results) {
          if (err){
            console.log(err);
            //error occured connecting to DB
          }
          else{
            if(results[1][0]['@o1']==-1){
              console.log("Invalid Code");
              //Artwork doesn't exist
            }
            else{
              var now = moment.utc();
              if(prevID!==null){
                //update previous checkin with new timestamp
              }
               //new checkin

              prevID = req.params.id;

              res.render('info', { title: results[1][0]['@o2'], data: {
                "artist": results[1][0]['@o3'],
                "year": results[1][0]['@o4'],
                "description": results[1][0]['@o5'], //Empty, unknown cause
                "type": results[1][0]['@o6'],
                "imgRef": results[1][0]['@o7']
                }
              });
            }
          }
        });
        */
      });


      app.post('/likefav', function(req, res){
        //update likes/favourites on page change
      });


      //app.get('/artInfo/:id', function(req, res){
        //res.render('artInfo', {title: 'Art Info', data: data, imgref: imgref });
      //});
    // app.post('/partial_artInfo0', function(req, res){
    //   //console.log(req.body.test);
    //   // test query - to sanity check it connects to the right db
    //   conn.query('SELECT ? FROM users LIMIT 1', [req.body.test], function(err, results) {
    //     if (err){
    //       res.send("<html><body><p>Error Occured - Please Try Again</p></body></html>")
    //     }
    //     else{
    //       console.log(results[0]);
    //       res.render('partial_artInfo0', { title: 'Art Info', imgref: '/images/cat1.jpg', data: results });
    //     }
    //   });

    //   // res.render('partial_artInfo0', { title: 'Art Info', imgref: '/images/cat1.jpg' });
    //   });

    //  FB POST  //
      // app.post('/updateFB', function(req, res){
      //   //SQL -check if user already exists, if not, add user
      //   //req.body.name/gender/birthday
      //   console.log(req.body.name);
      // });

      app.post('/exec_query', function (req, res) {
        conn.query(factory.sqlGen(req.body.qry, req.body.params).sqlStr, function (err, results) {
          if (err) {
            console.log(err);
          } else {
            //console.log(results);
            switch (req.body.qry) {
              case 1 :
                visitId = results[1][0]['visitId'];
                //console.log(visitId);
                break;
              default :
                res.send(results[1]);
                break;
            }
          }
        });
      });


// Run Server
app.listen(3000, function(){
  console.log("Listening on 3000");
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
  var str = "CALL insert_Visit(CURDATE()," // default to the current date
      str += userId + ",";
      str += params.museumId + ",@o1,@o2); SELECT @o1 AS 'success', @o2 AS 'visitId';"
  this.sqlStr = str;
}

var sqlGetvElementDetailsByCode = function (params) {
  this.sqlStr = squel.select()
                        .from("v_elementDetails")
                        .where(squel.expr().and("elementCode=" + params.elementCode).and("active=1"))
                        .toString();

}

function testRun () {
  var params = {'elementCode':7793};
  conn.query(factory.sqlGen(2,params).sqlStr, function (err, results) {
    console.log(results);
  });
}

//testRun();


