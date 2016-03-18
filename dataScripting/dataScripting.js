const environment = 'qa';
var mysql = require('mysql');
var squel = require('squel');
var gaussian = require('gaussian');

// testing paramters //
const c_museumId = 1; // use the Demo Museum
const c_year = 2016;
const c_month = 2;
const c_date = 17;

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
conn.connect( function (err) {
	if (err) {
		console.log('Error. Could not connect to ' + environment + ' database ...')
	} else {
		console.log('Connected to ' + environment + ' database ...');
	}
});

// Simulate a user visit //
function userVisit () {
	// get a list of visitor users //
	var sqlStr = squel.select().from("user").field("userId").where("userTypeId=1").toString();
	conn.query(sqlStr, function (err, results) {
		var users = [];
		if (err) {
			console.log("Error. Could not get list of visitors.");
			console.log(err);
		} else {
			for (x in results) {
				users.push(results[x].userId);
			}
			console.log(users);

			// start a visit  //
			var userId;



		}
	});
}

var vDate = function () {
	var d = new Date();
		
	// initalize the date
	this.init = function () {
		/*var hours = Math.floor(Math.random()*4) + 11; // get hours between 11-3
		var min = Math.floor(Math.random()*60) // get min
		var sec = Math.floor(Math.random()*60) // get sec*/
		d.setFullYear(c_year,c_month,c_date);
		d.setHours(rBusHours());
		d.setMinutes(rMinSec());
		d.setSeconds(rMinSec());
	}

	this.addCheckIn = function() {
		addTime(rCheckinTime());
	}

	this.addWait = function() {
		addTime(rWaitTime());
	}

	this.sqlDate = function() {
		return d.toISOString().slice(0, 19).replace('T', ' ');
	}

	// get random values
	function rBusHours () {
		return Math.floor(Math.random()*5) + 11 - 4; // get hours between 11-3, account for timezone offset
	}
	function rMinSec () {
		return Math.floor(Math.random()*60) // get min or sec
	}
	function rCheckinTime () {
		// compute a randome check in time, mean 45, sd 15
		return Math.floor(gaussian(45,255).ppf(Math.random()));
	}
	function rWaitTime () {
		// compute a random time, i.e. for walking to next item
		var waitLength = gaussian(0,1).ppf(Math.random());
		var addTime;
		if (waitLength < -0.84) {
			// 20% wait 10 sec - i.e. check into immediate beside
			addTime = Math.floor(gaussian(10,4).ppf(Math.random())); // 10 sec break
		} else if (waitLength < 0) {
			// 30% wait 1 min
			addTime = Math.floor(gaussian(60,144).ppf(Math.random()));
		} else if (waitLength < 0.85) {
			// 30% wait 3 min
			addTime = Math.floor(gaussian(120,576).ppf(Math.random()));
		} else {
			// 20% wait 10 min
			addTime = Math.floor(gaussian(600,14400).ppf(Math.random()));
		}
		return addTime;
	}
	function addTime(addSec) {
		var sec = d.getSeconds();
		var min = d.getMinutes();
		var hour = d.getHours();
		sec += addSec;
		min += Math.floor(sec / 60);
		sec = sec % 60;
		hour += Math.floor(min / 60);
		min = min % 60;
		d.setSeconds(sec);
		d.setMinutes(min);
		d.setHours(hour);
	}
}

vt = new vDate()
vt.init();
console.log(vt.sqlDate());
vt.addCheckIn();
console.log(vt.sqlDate());
vt.addWait();
console.log(vt.sqlDate());
vt.addWait();
console.log(vt.sqlDate());
vt.addCheckIn();
console.log(vt.sqlDate());

//userVisit();
conn.end();