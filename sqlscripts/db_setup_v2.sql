CREATE SCHEMA `muse_dev` DEFAULT CHARACTER SET utf8 ;
USE muse_dev ;

create table login (
	loginId integer not null auto_increment,
    active tinyint not null default 1,
    login varchar(255) not null,
    pass varchar(255) not null,
    userId integer not null,
    primary key(loginId)
);

alter table login
add constraint uc_login unique(login)


create table user (
	userId integer not null auto_increment, 
    active tinyint not null default 1,
    firstName varchar(255), 
    lastName varchar(255),
    gender integer,
    ageRange integer,
    primary key(userId)
);





--candidate key tables
drop table gender;
create table gender (
	gender integer not null auto_increment,
    genderDesc varchar(255) unique,
    primary key(gender)
);

drop table ageRange;
create table ageRange (
	ageRange integer not null auto_increment,
    ageRangeDesc varchar(255) unique,
    primary key(ageRange)
);

drop table loginType;
create table loginType (
	loginType integer not null auto_increment,
    loginTypeDesc varchar(255) unique,
    primary key(loginType)
);

drop table userType;
create table userType (
	userType integer not null auto_increment, 
    userTypeDesc varchar(255) unique,
    primary key(userType)
);