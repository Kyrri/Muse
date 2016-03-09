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


create table element (
	elementId integer not null auto_increment,
    active tinyint not null default 1,
    title varchar(255) not null,
    artist varchar(255),
    paintYear integer, 
    description longtext,
    elementType integer,
	primary key (elementId)
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


create table elementType (
	elementType integer not null auto_increment,
    elementTYpeDesc varchar(255) unique,
    primary key(elementType)
);

create table visit (
    visitId integer not null auto_increment, 
    tstamp timestamp not null default now(),
    active tinyint not null default 1,
    visitDate date not null,
    userId integer not null, 
    museumId integer not null,
    primary key(visitId)
);

create table elementTagType (
    elementTagTypeId integer not null auto_increment,
    elementTagTypeDesc varchar(255) unique,
    primary key(elementTagTypeId)
);

CREATE VIEW v_elementDetails AS
    select
        c.code as 'elementCode',
        c.elementId as 'elementId',
        e.active as 'active',
        e.title as 'elementId',
        a.artist as 'artist',
        e.paintYear as 'year',
        e.description as 'description',
        e.imageLink as 'imageLink'
    from elementCode c
    left join element e on c.elementId=e.elementId
    left join artist a on e.artistId=a.artistId