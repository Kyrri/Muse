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
app.use(app.static(__dirname + '/public'));

// Routes
app.get('/', routes.index);
app.get('/artInfo', routes.artInfo);
//app.get('/artInfo/:id', routes.artInfo);

app.listen(3000, function(){
  //console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  console.log("Listening on 3000");
});
