select * from member;

create sequence userno_seq 
	start with 1 
	increment by 1
	nocycle
	
create sequence bookingno_seq
	start with 1 
	increment by 1
	nocycle
select * from seat;
select * from member where id='admin'

select * from member;

select * from movie;

insert into MEMBER values (2, 't', 'www', '준열', '남자', '2015-01-01', '서울', '010-000', 'chljy3');

update member set addr='서울';

delete from member where memberno=7

select * from (select * from movie where REGEXP_LIKE(title, 'king','i')) abc where abc.title like '%2015"%'";

select * from movie;

select id from member where id='admin';

select * from movietime;

select distinct s_date, e_date from movietime where cinemaID='C_1' and movieCd=20145503

select * from seat;

insert into seat values(1, 'c1', '01관', 'A', 1, '일반', null);
insert into seat values(2, 'c1', '01관', 'A', 2, '일반', null);
insert into seat values(3, 'c1', '01관', 'A', 3, '일반', null);
insert into seat values(4, 'c1', '01관', 'A', 4, '일반', null);
insert into seat values(5, 'c1', '01관', 'B', 1, '일반', null);
insert into seat values(6, 'c1', '01관', 'B', 2, '일반', null);
insert into seat values(7, 'c1', '01관', 'B', 3, '일반', null);
insert into seat values(8, 'c1', '01관', 'B', 4, '일반', null);

날짜 시간 영화관 영화관번호에 해당하는 좌석
select * from seat where cinemaID='c1' and screenID='01관'
select * from seat;
select cinemaID from movie_cinema where movieCd=20145503 and isRun = '1'
select * from movietime;
select * from seat;
select * from movie;
select * from movie_cinema;
select * from cinema;
select * from screen;
select * from movietime where cinemaid='c1' and screenid='01관' and day='2015-11-18' and moviecd=20145503
and starttime='11:00';
select * from rating;
select * from booking_seat;
select * from booking;
select * from seat;

delete from booking where bookingno in (23,24)
delete from booking where bookingno=22;
delete from booking_seat
select * from booking;
select * from booking_seat;

insert into movie_cinema values(20145503, 'C_1', '1관', '1')
delete from movie where year in (2015, 2014, 2004)

select * from movie_cinema
select * from movietime where cinemaid='C_1' and movieCd=20145503

select * from movietime 
select * from movietime where cinemaid='C_1' and screenid='1관' and moviecd=20145503 and starttime='10:00' and s_date <= '2015-11-05' and e_date >= '2015-11-05'
select * from movietime where cinemaid='C_1' and screenid='1관' and moviecd=20145503 and s_date='2015-11-5'	and starttime='20:45'
cinemaID=C_1&screenID=1관&seats=F_10%2CB_10&movietime=20%3A45&movieCd=20145503&strdate=2015-11-5

alter table booking add (bookingdate Date);
update booking set bookingdate='2015-11-5';

select * from booking;

alter system set processes=500 scope=spfile;

drop table rating;

create table rating (
RATINGNO   NUMBER,
MOVIECD   VARCHAR2(2000),
RATING   NUMBER,
TIMESTAMP   VARCHAR2(2000),
MEMBERNO   NUMBER 
)