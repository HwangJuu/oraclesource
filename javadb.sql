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

delete from member where id=1;

commit;

create sequence member_seq;