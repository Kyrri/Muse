var express = require('express')
  , routes = require('./routes');

var app = require("express")();

// Configuration

app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));

// Routes

app.get('/', routes.index);
app.get('/artInfo', routes.artInfo);
//app.get('/artInfo/:id', routes.artInfo);

app.listen(3000, function(){
  //console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  console.log("Listening on 3000");
});
