var express = require('express');
var app = require("express")();
var routes = require('./routes');
var bodyParser = require('body-parser')
// MySQL connection
var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'muse_dev'
});

// Configuration
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: true
}));

// Important Globals
var loggedIn = false;

// Routes
  
  //  FACEBOOK LOGIN  //
    // app.get('/:var(|login)?', function(req, res){
    //   res.render('login', { title: 'LogIn'});
    // });
  //  INSECURE LOGIN  //
    app.get('/:var(|login)?', function(req, res){
      res.render('login_default', { title: 'Log In'});
    });
    app.post('/login', function(req,res){
      console.log("login");
      //SQL Check Exists
      loggedIn = true;
      //if exists
      res.send(true);
    });
    app.get('/signup', function(req, res){
      res.render('signup_default', { title: 'Sign Up'});
    });
    app.post('/signup', function(req,res){
      console.log("signup");
      //SQL add to database
      loggedIn = true;
      //if successful
      res.send(true);
    });
  //  STARTING PAGE  //
  app.get('/index', function(req, res){
    res.render('index', { title: 'Muse'});
  });
  app.get('/artInfo', function(req, res){
     res.render('artInfo', { title: 'Art Info'});
  });
  app.get('/selectMuseum', function(req, res){
    res.render('selectMuseum', { title: 'Select Museum'});
  });
  app.get('/info', function(req, res){
    res.render('info', { title: 'Info'});
  });
  app.get('/selectPlanType', function(req, res){
    res.render('selectPlanType', { title: 'Select Plan Type'});
  });
  app.get('/beginTour', function(req, res){
    res.render('beginTour', { title: 'Begin Tour'});
  });
  //app.get('/artInfo/:id', function(req, res){
    //res.render('artInfo', {title: 'Art Info', data: data, imgref: imgref });
  //});
app.post('/partial_artInfo0', function(req, res){
  //console.log(req.body.test);
  conn.connect();

  // test query - to sanity check it connects to the right db
  conn.query('SELECT ? FROM users LIMIT 1', [req.body.test], function(err, results) {
    if (err){
      res.send("<html><body><p>Error Occured - Please Try Again</p></body></html>")
    }
    else{
      console.log(results[0]);
      res.render('partial_artInfo0', { title: 'Art Info', imgref: '/images/cat1.jpg', data: results });
    }
  });
  conn.end();

  // res.render('partial_artInfo0', { title: 'Art Info', imgref: '/images/cat1.jpg' });
  });

// Non-Renders
  app.post('/updateFB', function(req, res){
    //SQL -check if user already exists, if not, add user
    //req.body.name/gender/birthday
    console.log(req.body.name);
  });


// Run Server
app.listen(3000, function(){
  console.log("Listening on 3000");
});