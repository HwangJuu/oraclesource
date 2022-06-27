--주석 
-- sql 구문은 대소문자를 구문하지 않음(단, 비밀번호는 구별함)
-- scott/TIGER

-- hr 사용자의 비밀번호 변경

ALTER USER hr IDENTIFIED BY hr
    ACCOUNT UNLOCK;
    
--오라클 데이터베이스 특징
--테이블, 인덱스, 뷰 ... 여러가지 객체가 사용자별로 생성되고 관리
--사용자 == 스키마(데이터베이스 구조 범위)

--사용자 생성
--create user 아이디 IDENTIFIED BY 비밀번호;
create user test1 IDENTIFIED BY 12345;
--user TEST1 lacks CREATE SESSION privilege; logon denied : 권한이 없다는 메세지

--권한 부여
--grant create 권한명 to 사용자;
grant create session to test1;

--사용자 생성, 권한부여 -> 테이블 생성  : 오류 
--table 생성 권한 부여
grant create table to test1;

--롤(여러권한들을 묶어 놓은 개념)
--모든 권한들을 하나하나 주긴 힘드니 롤를 사용
--resource : 시퀀스, table, tirgger ..객체 생성할 수 있는 권한이 모여 있음
--connect : create session 이 들어 있음
grant resource,connect to test1;


--사용자 비밀번호 변경
alter user test1 IDENTIFIED BY 54321;

--사용자 삭제 ( 커맨드 창 닫고 삭제하기)
--drop user test1 cascade; 값을 같이 삭제
drop user test1 cascade;


--수업중 사용할 생성자
create user javadb IDENTIFIED BY 12345;
grant resource, connect to javadb;

--scott에게 view 생성 권한 부여
grant create view to scott;


--프로젝트
create user solmarket IDENTIFIED BY 12345;
grant resource, connect to solmarket;


-- 파이썬 수업중 사용할 생성자
create user pyuser IDENTIFIED BY 12345;
grant resource, connect to pyuser;






