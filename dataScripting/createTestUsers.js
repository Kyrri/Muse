var fs = require('fs');
var squel = require('squel');
var count = 1;
var insert, sqlStr = '';

for(i=0;i<3;i++) {
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
}

fs.writeFile('../sqlscripts/testUsers.sql', sqlStr, function (err) {
	if (err) {
		console.log("The world has fucking ended ...");
	}
});