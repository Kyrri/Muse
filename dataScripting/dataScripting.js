const environment = 'qa';
var mysql = require('mysql');
var squel = require('squel');
var gaussian = require('gaussian');

// testing paramters //
const c_museumId = 1; // use the Demo Museum
var c_year = 2016;
var c_month = 2;
//var c_date = 15;

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
function userVisit (userId) {
	var elementSql = squel.select().from("v_elements").where("museumId="+c_museumId).where("active='Active'").toString()+";";
	var sqlStr = elementSql;
	conn.query(sqlStr, function (err, results) {
		if (err) {
			console.log("Error. Could not get list of visitors.");
			console.log(sqlStr);
			console.log(err);
		} else {
			var elements = [];
			for (x in results) {
				elements.push(results[x]['code']);
			}

			// start a visit  //
			var vt = new vDate(); // start a visit time
			var insertVisitSql;

			vt.init();
			insertVisitSql = "CALL insert_visit('"+vt.sqlDate()+"',"+userId+","+c_museumId+",'"+vt.sqlDate()+"',@o1,@o2); ";
			insertVisitSql += "SELECT @o1 AS 'success', @o2 AS 'visitId';";

			//console.log("Trying: " + insertVisitSql);
			conn.query(insertVisitSql, function (err, results) {
				if (err) {
					console.log("Error. Insert visit failed.");
					console.log(insertVisitSql);
					console.log(err);	
				} else {
					var visitId = results[1][0].visitId
					vt.addWait(); // wait before first visit;

					// select and element
					var numElements = Math.floor(Math.random()*5) + 20; // chose 10+/-3 elements
					var elementChoose, elementCode;
					var checkInSql, checkOutSql, likesSql, favsSql, visitEndSql, sqlStr2;

					for (i=0;i<numElements;i++) {
						elementChoose = Math.floor(Math.random()*elements.length); // select a random element //
						elementCode = elements[elementChoose];
						elements.splice(elementChoose,1); // remove chosen element from the list

						checkInSql = "CALL insert_interaction(1,"+userId+","+elementCode+","+visitId+",'"+vt.sqlDate()+"',@o1); ";
						vt.addCheckIn(); // the time checking in 
						checkOutSql = "CALL insert_interaction(4,"+userId+","+elementCode+","+visitId+",'"+vt.sqlDate()+"',@o1); ";
						likesSql = "CALL insert_interaction(2,"+userId+","+elementCode+","+visitId+",'"+vt.sqlDate()+"',@o1); ";
						favsSql = "CALL insert_interaction(3,"+userId+","+elementCode+","+visitId+",'"+vt.sqlDate()+"',@o1); ";
						visitEndSql = "CALL insert_interaction(6,"+userId+",null,"+visitId+",'"+vt.sqlDate()+"',@o1); ";

						sqlStr2 = checkInSql + checkOutSql;
						if (prob(0.33)) { sqlStr2 += likesSql; } // 33% chance of liking
						if (prob(0.20)) { sqlStr2 += favsSql; } // 20% chance of fav
						if (i==numElements-1) { sqlStr2 += visitEndSql; } // end the visit on the last element

						//console.log(sqlStr2);
						//console.log("Trying: " + sqlStr2);
						conn.query(sqlStr2, function (err,results) {
							if (err) {
								console.log("Error. Insert interactions failed.");
								console.log(sqlStr2);
								console.log(err);	
							}
						});
		
						vt.addWait(); // time to walk to the next element
						if (i==numElements-1) { console.log("Success. Vist complete for user: "+userId+" on "+vt.sqlDate()); } 
					}
				}
			});
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
		d.setFullYear(c_year,Math.floor(Math.random()*4),Math.floor(Math.random()*28)+1);
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
		if (waitLength < gaussian(0,0.05).ppf(0.1)) {
			// 20% wait 10 sec - i.e. check into immediate beside
			addTime = Math.floor(gaussian(10,3).ppf(Math.random())); // 10 sec break
		} else if (waitLength < gaussian(0,1).ppf(0.3)) {
			// 30% wait 1 min
			addTime = Math.floor(gaussian(60,144).ppf(Math.random()));
		} else if (waitLength < gaussian(0,1).ppf(0.75)) {
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

function prob(percentage) {
	if (gaussian(0,1).ppf(Math.random()) < gaussian(0,1).ppf(percentage)) {
		return true;
	} else {
		return false;
	}
}

function main() {
	var userId = 5
	setInterval( function () {
		if (userId <= 85) {
			userVisit(userId);
			userId ++
		}
	},500)
}
main();





