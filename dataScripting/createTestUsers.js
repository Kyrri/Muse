var fs = require('fs');
var squel = require('squel');
var count = 1;
var insert, sqlStr = '';

/*for(i=0;i<10;i++) {
	for (age=1;age<10;age++) {
		for (gen=1;gen<4;gen++) {
			insert = squel.insert().into("user")
					.set("firstName", "t"+count)
					.set("lastName", "tester")
					.set("gender",gen)
					.set("ageRange",age)
					.set("userTypeId", 1).toString() + ";\n";
			sqlStr += insert;
			count++;
		}
	}
}*/

for(i=0;i<250;i++) {
	if (i < 115) {
		gen = 1;
	} else if (i < 230) {
		gen = 2;
	} else {
		gen = 3;
	}
	if (i < 23) {
		age = 1;
	} else if (i < 34) {
		age = 2;
	} else if (i < 47) {
		age = 3;
	} else if (i < 94) {
		age = 4;
	} else if (i < 147) {
		age = 5;
	} else if (i < 201) {
		age = 6;
	} else if (i < 220) {
		age = 7;
	} else if (i < 230) {
		age = 8;
	} else  {
		age = 9;
	} 

	insert = squel.insert().into("user")
					.set("firstName", "t"+i)
					.set("lastName", "tester")
					.set("gender",gen)
					.set("ageRange",age)
					.set("userTypeId", 1).toString() + ";\n";
			sqlStr += insert;
}

fs.writeFile('../sqlscripts/testUsers.sql', sqlStr, function (err) {
	if (err) {
		console.log("The world has fucking ended ...");
	}
});