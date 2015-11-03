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
// Routes
  app.get('/', function(req, res){
    res.render('index', { title: 'Muse'});
  });
  app.get('/artInfo', function(req, res){
     res.render('artInfo', { title: 'Art Info'});
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


// Run Server
app.listen(3000, function(){
  //console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  console.log("Listening on 3000");
});