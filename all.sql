use project2;

CREATE TABLE calendarlist(
	schedulenum int(11) auto_increment primary key,
	id varchar(50),
	checkdate date,
	content varchar(100)
);

CREATE TABLE members(
	mid varchar(20) primary key,
	pw varchar(20),
	name varchar(20),
	birth varchar(20),
	gender varchar(20),
	email varchar(20),
	tel varchar(20)
);

CREATE TABLE reservation(
	resnum varchar(100),
	regnum varchar(100),
	wnum varchar(100),
	resdate varchar(100),
	type varchar(100),
	etc varchar(100),
	state varchar(100),
	kdate datetime,
	resgroup int(11)
);

CREATE TABLE worker(
	wnum int(11) auto_increment primary key,
	mid varchar(20),
	type1 varchar(100),
	period1 int(11),
	type2 varchar(100),	
	period2 int(11),
	type3 varchar(100),	
	period3 int(11),
	address1 varchar(100),
	address2 varchar(100),
	wcontent text,
	img varchar(100)
);

CREATE TABLE workerboard(
	wrid int(11) auto_increment primary key,
	resnum varchar(100),
	wnum int(11),
	mid varchar(100),
	rating decimal(2,1),
	wrcontent text,
	wrdate datetime
);


CREATE TABLE user(
	resnum varchar(100),
	mid varchar(100),
	storename varchar(100),
	postcode varchar(100),
	roadaddress varchar(100),
	detailaddress varchar(100),
	type varchar(100),
	ssize varchar(100),
	sinfo varchar(100),
	simgsrc varchar(100)
);

