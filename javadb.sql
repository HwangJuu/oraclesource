create table emp(
     empno number(2));
     
drop table emp;

-- member 테이블 생성
-- id(숫자, 8) pk
-- name(가변문자열, 20) not null
-- addr(가변문자열, 50) not null
-- email(가변문자열, 30) not null
-- age (숫자,3)
create table member(
    id number(8) primary key,
    name varchar2(20) not null,
    addr varchar2(50) not null,
    email varchar2(30) not null,
    age number(3));
    
select * from member;

delete from member;

commit;

create sequence member_seq;

insert into member values(member_seq.nextval, '홍길동', '서울', 'abc123', 15);
insert into member values(member_seq.nextval, '김길동', '경기도', 'def123', 29);
insert into member values(member_seq.nextval, '박길동', '부산', 'zxc444', 30);
insert into member values(member_seq.nextval, '이길동', '광주', 'kkk789', 41);


DROP TABLE bookTBL;

commit;

--2022.04.13
select * from membertbl;

--2022.04.15
select * from item;

--2022.04.18
select * from board;

--2022.04.22
select * from spring_board;

--2022.05.17
drop table memotbl;

drop sequence mem_seq;


--2022.05.18

select * from guestbook;

delete from guestbook;


commit
