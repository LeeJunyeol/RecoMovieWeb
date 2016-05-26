 drop table board3;
    
    create table board3(
    boardno number(20),
    userid varchar2(50),
    name varchar2(100),
    title varchar2(3000),
    contents varchar2(4000),
    insertDate varchar2(50),
    hits number
    );
    
    create sequence board_seq
    increment by 1
    start with 1
    nocycle nocache;
   
 insert into BOARD3 values(1,'admin','관리자','환영합니다.','첫 글입니다.','2016-01-15',0)