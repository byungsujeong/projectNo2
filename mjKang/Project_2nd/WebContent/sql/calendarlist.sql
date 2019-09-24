create database projectno2;

use projectno2;

CREATE TABLE calendarlist(
	schedulenum int auto_increment primary key,
	id varchar(50),
	checkdate date,
	content varchar(100)
);

/* 각 id마다 checkdate 중복되지 않아야함 -> 조건 어떻게? */

insert into calendarlist values(null,'kang','2019-09-06','예약');
insert into calendarlist values(null,'kang','2019-09-07','휴무');
insert into calendarlist values(null,'kang','2019-09-09','휴무');
insert into calendarlist values(null,'sang','2019-09-16','휴무');
insert into calendarlist values(null,'sang','2019-09-17','휴무');
insert into calendarlist values(null,'sang','2019-09-18','휴무');
insert into calendarlist values(null,'Yang','2019-09-06','예약');
insert into calendarlist values(null,'Yang','2019-09-07','예약');
insert into calendarlist values(null,'Yang','2019-09-08','예약');
insert into calendarlist values(null,'Yang','2019-09-09','예약');
insert into calendarlist values(null,'Yang','2019-09-14','휴무');
insert into calendarlist values(null,'Yang','2019-09-15','휴무');
insert into calendarlist values(null,'Yang','2019-09-16','예약');

