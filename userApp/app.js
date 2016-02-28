var express = require('express');
var app = require("express")();
var routes = require('./routes');
var bodyParser = require('body-parser')
var password = require('password-hash-and-salt');
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
  
  //  FACEBOOK LOGIN  //
    // app.get('/:var(|login)?', function(req, res){
    //   res.render('login', { title: 'LogIn'});
    // });
  //  INSECURE LOGIN/SIGNUP  //
    app.get('/:var(|login)?', function(req, res){
      res.render('login_default', { title: 'Log In'});
    });
    app.post('/login', function(req,res){
     // test query - to sanity check it connects to the right db
      conn.query('CALL userLogin("'+req.body.email+'",'+1+',@o1); SELECT @o1, @o2', function(err, results) {
        if (err){
          console.log(err);
        }
        else{
          if(results[1][0]['@o1']==-1){

            res.send(JSON.stringify({"Success": false, "ErrType": "email", "Message": results[1][0]['@o2']}));
            //User Doesn't Exist
          }
          else{
            password(req.body.password).verifyAgainst(results[1][0]['@o2'], function(error, verified){
              if(error){
                console.log("error in password verification");
              }
              else if(!verified){
                console.log("password is incorrect");
                res.send(JSON.stringify({"Success": false, "ErrType": "password", "Message": "Incorrect Password"}));
              }
              else{
                loggedIn = true;
                res.send(JSON.stringify({"Success": true, "ErrType": null, "Message": "Login Successful"}));
              }

            });
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
        res.render('selectMuseum', { title: 'Select Museum'});
      });
      app.get('/selectPlanType', function(req, res){
        res.render('selectPlanType', { title: 'Select Plan Type'});
      });
      app.get('/beginTour', function(req, res){
        res.render('beginTour', { title: 'Begin Tour'});
      });

      //  DURING VISIT //
      app.get('/checkIn', function(req, res){
        res.render('checkIn', {title:'Check In'});
      });
      app.post('/checkIn', function(req, res){
        req.body.code;

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
      });
      app.get('/tap', function(req, res){
        res.render('tap', { title: 'tap'});
      });
      app.get('/info/:id', function(req, res){
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


// Run Server
app.listen(3000, function(){
  console.log("Listening on 3000");
});