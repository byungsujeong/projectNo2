use projectno2;

create table reservationlist (
	reserveNum int auto_increment primary key,/*예약 요청시 부여되는 번호*/
	wNum varchar(50), /*요청받은 worker 번호*/
	regNum varchar(50), /*예약 요청자 사업자번호*/
	reserveDate date, /*예약 요청 날짜*/
	reserveName varchar(50), /*예약 요청자 이름*/
	type1 varchar(50),
	address1 varchar(50),
	state int(1) not null CHECK(state IN(-1,0,1))/*state 값 3가지?*/
);

insert into reservationlist values(null,'yang','1234-5555','2019-09-06','최영진','카페','서울',0);
insert into reservationlist values(null,'kang','0987-6666','2019-09-07','정병수','음식점','경기',0);
insert into reservationlist values(null,'yang','1234-5555','2019-09-10','최영진','카페','서울',0);
insert into reservationlist values(null,'kang','0987-6666','2019-09-15','정병수','음식점','경기',0);
insert into reservationlist values(null,'yang','1234-5555','2019-09-17','최영진','카페','서울',0);
insert into reservationlist values(null,'kang','7231-7231','2019-09-20','강민재','카페','부산',0);
insert into reservationlist values(null,'kang','7231-7231','2019-09-22','강민재','카페','부산',0);
insert into reservationlist values(null,'yang','9999-0000','2019-09-28','김갑동','카페','서울',0);
insert into reservationlist values(null,'moon','1111-1111','2019-09-13','moon','카페','서울',0);


