var express = require('express');
var app = require("express")();
var routes = require('./routes');
var mysql = require('mysql');
// var connection = mysql.createConnection({
//   host: "",
//   user: "",
//   password: "" ,
//   database: ""
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
     res.render('artInfo', { title: 'Art Info', imgref: '/images/cat1.jpg' });
  });
  //app.get('/artInfo/:id', function(req, res){
    //res.render('artInfo', {title: 'Art Info', data: data, imgref: imgref });
  //});

app.listen(3000, function(){
  //console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  console.log("Listening on 3000");
});
