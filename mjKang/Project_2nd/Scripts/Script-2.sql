create database projectno2;

use projectno2;

CREATE TABLE calendarlist(
	schedulenum int auto_increment primary key,
	id varchar(50),
	checkdate date,
	content varchar(100)
);

insert into calendarlist values(null,'kang','2019-09-06 06:25:38','부산');
insert into calendarlist values(null,'sang','2019-09-06','휴무');
insert into calendarlist values(null,'Yang','2019-09-06','예약');

/*state int(1),*//*1만 들어감*/