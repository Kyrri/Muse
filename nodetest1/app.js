var express = require('express');
var app = require("express")();
var routes = require('./routes');

// MySQL connection
var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'muse_dev'
});
// conn.connect();

// // test query - to sanity check it connects to the right db
// conn.query('SELECT * FROM visitor LIMIT 1', function(err, results) {
//   if (err) throw err;
 
//   console.log(results[0]);
// });


// Configuration

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));

// Routes
  app.get('/', function(req, res){
    res.render('index', { title: 'Muse'});
  });
  app.get('/artInfo', function(req, res){
     res.render('artInfo', { title: 'Art Info'});
  });
  app.get('/partial_artInfo0', function(req, res){
     res.render('partial_artInfo0', { title: 'Art Info', imgref: '/images/cat1.jpg' });
  });
  //app.get('/artInfo/:id', function(req, res){
    //res.render('artInfo', {title: 'Art Info', data: data, imgref: imgref });
  //});

app.listen(3000, function(){
  //console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  console.log("Listening on 3000");
});