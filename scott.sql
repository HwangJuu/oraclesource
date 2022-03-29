--scott 비밀번호 TIGER
-- dept 테이블 정보(부서정보-부서번호, 부서명, 위치)
DESC
dept;

--사원 정보(사원번호, 사원명, 직책,직속상관의 사원번호, 입사일, 급여, 추가수당, 부서번호)
DESC emp;

--급여구간(등급, 최저급여, 최고급여)
desc salgrade;

--조회(SELECT) : 실무에서 가장 많이 사용.핵심
--SELECT 조회하고 싶은 열 이름 나열
--FROM : 조회할 테이블명

SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;
    
--* : 전체를 의미
SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

-- DISTINCT : 중복 데이터 제거
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- ALAIS(별칭)
-- as 별칭 : as 생략 가능
SELECT
    ename           AS 사원명,
    sal             급여,
    comm            AS "추가 수당",
    sal * 12 + comm AS 연봉
FROM
    emp;
    
-- 원하는 순서로 출력 데이터를 정렬
-- order by 정렬할 열이름 [정렬옵션]

--emp 테이블에서 ename,sal 조회할 때 sal 내림차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC; --내림차순
    
--emp 테이블에서 ename,sal 조회할 때 sal 오름차순 조회    
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal -- 기본 정렬값이 오름차순(명시 값은 ASC) 
    
-- EMP 테이블의 전체 열을 조회(부서번호는 오름차순,급여의 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
    
-- 특정한 조건을 기준으로 데이터 조회
-- SELECT ~FROM ~WHERE : 기준을 작성
SELECT
    *
FROM
    emp
WHERE
    deptno = 30; --'=' : 같다
    
--사원번호가 7782인 사원을 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;
    
-- 부서 번호가 30이고 사원직책이 SALESMAN인 사원 조회
-- 문자열 표현은 : 홑따옴표 / 쿼리문은 대소문자 구분 안함. 들어가 있는 내용에 대한 대소문자는 구분
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';--salesman : 소문자로 입력시 조회가 안됨.
    
-- 사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;
    
--부서번호가 30 이거나, 사원직책이 CLERK 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

-- 연산자
-- 산술연산자
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
    
-- 비교연산자(<,>,<=,>=)
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

--ENAME 'F' 이상인 사원 조회(사원 이름의 첫 문자가 F와 같거나 뒤쪽인 사원 조회)
--문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
-문자를 대소비교 연산자가 가능
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';' ;--문자도 대소비교가 가능함.
    
--급여가 2500이상이고, 직업이 ANALYST 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';
    
-- 직무가 MANAGER, SALESMAN, CLERK 인 사원 조회
  SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';
    
-- 등가비교연산자(같다 :=,같지 않다 : !=, <>, ^=)
-- 급여가 3000이 아닌 사원 조회
--!=
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;
-- <>
SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;
--^=

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

    
--논리 부정 연산자(true -false) : NOT
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
    
-- IN 연산자 : = 의 의미와 같음
-- 직무가 MANAGER, SALESMAN, CLERK 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

-- IN 사용해서 부서번호가 10, 20번인 사원 조회    
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
  
-- job 'MANAGER'아니고 ,'SALESMAN'아니고, 'CLERK' 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job <> 'SALESMAN'
    AND job^= 'CLERK';
    
-- NOT + IN
SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );
    
    
-- BETWEEN A AND B 연산자 : 급여가 2000이상 3000이하

 SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;


SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
--급여가 2000이상 3000이하가 아닌 사원 조회

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;
    
-- LIKE 연산자와 와일드 카드( _ : 어떤 값이든 상관없이 단 한개의 문자 데이터
--                        % : 어떤 값이든 상관없고 길이와 상관없이 모든 문자 데이터) 

--사원 이름이 S로 시작하는 사원 정보 조회
 SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원 이름의 두번째 글자가 L인 사원 정보 조회

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

--사원이름에 AM이 들어있는 사원 정보 조회

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--사원이름에 AM이 들어있지 않은 사원 정보 조회

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
    
-- IS NULL / IS NOT NULL 연산자
-- COMM 이 null인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    comm = NULL; -- null에는 = 사용 못함

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;  
    
-- MGR 이 널이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
    
--집합 연산자
--union(합집합),minus(차집합), intersect(교집합)

--deptno =10 or deptno=20 사원 조회 : union 사용해서 
--union(중복값 제거 함)
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 20;


-- UNION ALL(중복제거 안함) 
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10;

-- minus
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
    
--INTERSECT
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10; 
    
--[문제] 사원 이름(ENAME)이 S로 끝나는 사원 데이터를 출력한다
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

--[문제] 30번 부서(DEPTNO)에서 근무하고 있는 사원 중에 직책(JOB)이 SALESMAN 인
--사원의 사원번호, 이름, 직책, 급여, 부서 번호를 출력한다.
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';


--[문제] 20번,30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000초과인 
--사원을 다음 두가지 방식의 SELECT 문을 사용하여 사원번호, 이름, 직책, 급여,
--부서 번호를 출력하는 SQL 문을 작성해 보시오.
--집합 연산자를 사용하지 않는 방식
 SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;


--집합 연산자를 사용한 방식
--minus사용

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


--[문제] NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여(SAL) 열 값이 
--2000 이상 3000이하 범위 이외의 값을 가진 데이터만 출력하도록 SQL 문을 작성하시오.
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 30000;

--[문제] 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가
--아닌 사원 이름, 사원번호, 급여, 부서 번호를 출력하는 SQL문을 작성
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

--[문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER,CLERK인 사원
--중에서 사원 이름의 두번째 글자가 L이 아닌 사원의 정보를 출력하는 SQL 문을 작성
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
    
--오라클 함수

-- 대소문자 변경 : UPPER(), LOWER(),INITCAP()
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;
--dual : sys가 소유하는 테이블
--     임시 연산이나 함수의 결과값 확인하는 용도

--문자열 길이 : LENGTH/ 문자열 바이트 수 반환 : LENGTHB
SELECT
    length('한글'),
    lengthb('한글'),
    length('ab'),
    lengthb('ab')
FROM
    dual;

SELECT
    ename,
    length(ename)
FROM
    emp;
    
--[실습] 직책이름이 6글자 이상인 사원 조회
SELECT
    *
FROM
    emp;

WHERE
    length(job) >= 6;
    
-- 문자열 추출 : substr(원본데이터, 시작위치, [추출길이]-옵션)

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

--[문제] emp 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력
--ename, 추출문자열 출력

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

-- 문자열 데이터 안에서 특정 문자 위치 찾기 : 
-- INSTR(문자열 데이터, 위치를 찾으려고 부분문자,시작 위치,시작위치에서 찾으려는 문자 몇번째인지 지정)
SELECT
    instr('HELLO ORACLE!', 'L')       AS instr1,
    instr('HELLO ORACLE!', 'L', 5)    AS instr2,
    instr('HELLO ORACLE!', 'L', 2, 2) AS instr3
FROM
    dual;
    
--사원이름에 S가 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;
    
--특정문자를 다른 문자로 변경 : REPLACE(원본, 찾는 문자, 바꿀문자)
SELECT '010-1234-5678' AS replace_before, 
       replace('010-1234-5678','-',' ')  AS replace1,
       replace('010-1234-5678','-')  AS replace2
FROM dual;

--문자열 연결 : CONCAT(문자1,문자2)
SELECT CONCAT(EMPNO,ENAME)
FROM emp;

SELECT CONCAT(EMPNO,concat(':',ENAME))
FROM emp;

    
--문자열 연결 : ||
SELECT EMPNO || ENAME
FROM emp;

SELECT EMPNO || ':' || ENAME
FROM emp;

-- 문자열 공백 : TRIM(), LTRIM(), RTRIM()
SELECT '   이것이   ',TRIM('   이것이   '),LTRIM('   이것이   '),RTRIM('   이것이   ')
FROM dual;

   
   
 --2022.03.21 월요일   
--숫자함수
--rount() : 반올림, trunc() : 버림,
--ceil() : 지정된 숫자보다 큰 정수중에서 가장 작은 정수
--floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
--mod() : 나머지

    SELECT round(1234.5678) as round,
    round(1234.5678,0) as round1,
    round(1234.5678,1) as round2,
    round(1234.5678,2) as round3,
    round(1234.5678,-1) as round4,
    round(1234.5678,-2) as round5   
    FROM dual;
    
    SELECT trunc(1234.5678) as trunc,
   trunc(1234.5678,0) as trunc1,
   trunc(1234.5678,1) as trunc2,
   trunc(1234.5678,2) as trunc3,
   trunc(1234.5678,-1) as trunc4,
    trunc(1234.5678,-2) as trunc5
   
    FROM dual;
    
    select ceil(3.14), floor(3.14),ceil(-3.14), floor(-3.14)
    from dual;
    
    select mod(15,6), mod(10,2), mod(11,2)
    from dual;
    
--날짜 함수
-- sysdate, current_date, current_timestamp

select sysdate, current_date, current_timestamp
from dual;

select 
sysdate as now,
sysdate-1 as yesterday,
sysdate+1 as tomorrow

from dual;

--add_months() : 몇개월 이후 날짜 구하기
select sysdate, add_months(sysdate,3)
from dual;

--입사 20주년이 되는 사원들 조회
select empno, ename, hiredate, add_months(hiredate,240) 
from emp;

--현재 날짜를 기준으로 입사45년 미만인 사원 조회
select *
from emp
where add_months(hiredate,540) > sysdate;

-- months_between(날짜1, 날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력
select empno, ename, hiredate,sysdate,months_between(hiredate,sysdate) as months1,
months_between(sysdate,hiredate) as months2, trunc(months_between(sysdate, hiredate)) as months3
from emp;

--next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
select sysdate, next_day(sysdate,'월요일'), last_day(sysdate)
from dual;

--형변환 함수
select empno,ename,empno+'500'
from emp
where ename+'SCOTT';
DESC emp;

select empno, ename, 'abcd'+ empno
from emp
where ename = 'SMITH';

-- TO_CHAR() : 숫자, 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') as 현재날짜시간
from dual;

SELECT
TO_CHAR(sysdate, 'MM') as MM,
TO_CHAR(sysdate, 'MON') as MON,
TO_CHAR(sysdate, 'MONTH') as MONTH,
TO_CHAR(sysdate, 'DD') as DD,
TO_CHAR(sysdate, 'DY') as DY,
TO_CHAR(sysdate, 'DAY') as DAY

from dual;

SELECT
TO_CHAR(sysdate, 'HH24:MI:SS') as HH24MISS, --24시간제
TO_CHAR(sysdate, 'HH24:MI:SS AM') as MON,
TO_CHAR(sysdate, 'HH24:MI:SS P.M.') as HHMISS_PM,
TO_CHAR(sysdate, 'HH24:MI:SS') as HHMISS --12시간제

from dual;

--TO_NUMBER
SELECT 1300-'1500',
'1300'+1500
FROM DUAL;

SELECT 
'1,300'+'1,500'
FROM DUAL;

--9 : 숫자 한자리를 의미함
SELECT 
TO_NUMBER('1,300','999,999') + TO_NUMBER('1,500','999,999')
FROM DUAL;

SELECT SAL, TO_CHAR(sal,'$999,999') AS sal_$
FROM EMP;

--문자데이터를 날짜 형식으로 변환
select
to_date('2022-03-22','YYYY-MM-DD') as date1,
to_date('20220322','YYYY-MM-DD') as date2
from dual;

--1981년 6월 1일 이후에 입사한 사원 정보 조회
select *
from emp
where hiredate > to_date('19810601','YYYY-MM-DD');

--null 처리 함수
select empno, ename, sal, comm, sal+comm
from emp;

--nvl(널값 열, 널인 경우 사용할 값)
select empno, ename, sal, nvl(comm,0), sal+nvl(comm,0)
from emp;

--nvl2(널값 열, 널이 아닐 경우 사용할 값, 널인 경우 사용할 값)
select empno, ename, sal, nvl2(comm,'0','X'), sal+nvl2(comm,sal*12 + comm,sal*12)
from emp;

--DCODE 함수와 CASE문
--decode(대상이 될 열 혹은 데이터,
--    조건1, 조건1과 일치시 반환할 결과
--    조건2, 조건2와 일치시 반환할 결과
--    else,defult에 해당) 조건1 ~조건 n까지 만족안할 때 반환할 결과
--)

--job에 따라 비율을 다르게 준 다음 연산
select empno, ename, job, sal,
 decode(job,'MANIGER', sal * 1.1,
         'SALESMAN', sal * 1.05,
         'ALALYST', sal,
         sal*1.03
) as upsal
from emp;

-- case문
select empno, ename, job, sal,
 case job
   when 'MANIGER' then sal * 1.1
   when 'SALESMAN' then sal * 1.05
   when 'ALALYST' then sal
   else  sal*1.03
 end as upsal
from emp;

--case문 변형 
select empno, ename, job, sal,
 case
   when comm is null then '해당사항없음'
   when comm=0 then '수당없음'
   when comm>0 then '수당:' || comm
 end as comm_text
from emp;


--[실습1] emp 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
--하루 근무시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 
--시급(TIME_PAY)를 계산하여 결과를 출력한다.
-- 단, 하루 급여는 수소점 세째자리에서 버리고, 시급은 두번째 소수점에서 반올림

select empno, ename, sal,
trunc(sal/21.5,2) as day_pay,
round(sal/21.5/8,1) as tim_pay
from emp;

--[실습2] emp 테이블에서 사원들은 입사일(hiredate)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다
--사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 M/A로 출력
select
comm,
nvl(comm,'n/a')--에러 발생
from emp;

select
comm,
nvl(to_char(comm),'n/a')
from emp;

select empno, ename,hiredate,
   next_day(add_months(hiredate,3), '월요일') as r_job,
   nvl(to_char(comm), 'N/A') as comm
from emp;

--[실습3] emp 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(mgr)를
--다음과 같은 조건을 기준으로 변환해서 CHG_MGR열에 출력
--mgr 존재하지 않으면 0000
--mgr 75인 경우 : 5555
--mgr 76인 경우 : 6666
--mgr 77인 경우 : 7777
--mgr 78인 경우 : 8888
-- 그 외 원래대로 mgr 출력
select empno, ename, mgr,
    decode(substr(to_char(mgr),1,2),
    null, '0000',
    '75','5555',
    '76','6666',
    '77','7777',
    '78','8888',
    substr(to_char(mgr),1)
) as chg_mgr
from emp

--다중행 함수 : 여러개를 묶어서 한번에 해결
-- sum(),count(), max(), min(), avg()
--추가수당 합계
select sum(comm)
from emp;



select sum(DISTINCT sal), sum(sal)
from emp;

--emp 테이블 사원 수 출력
select count(empno)
from emp;

--null은 카운트 되지 않음
select count(comm)
from emp;

select count(*)
from emp;

--부서번호가 30번인 사원 수 출력
select count(*)
from emp
where deptno = 30;

--max,min
--급여의 최대값
select max(sal) from emp;

--급여의 최소값
select min(sal) from emp;

--부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
select min(hiredate)
from emp
where deptno=20;

--부서번호가 20번인 사원 중 가장 최근 입사일 구하기
select max(hiredate)
from emp
where deptno=20;

--평균 avg
--부서번호가 30번인 사원들의 급여 평균출력
select round(avg(sal))
from emp
where deptno=30;


-- 부서별 평균 급여 출력 : group by 
--ORA-00937-> 오류
select deptno, avg(sal) --ORA-00937: not a single-group group function : group function 그룹이 필요
from emp;

-- group by  : 결과값을 우너하는 열로 묶어 출력
--부서별 급여의 평균을 알고 싶음
select deptno, avg(sal)
from emp
group by deptno;

--부서별, 직책별 급여 평균 출력
--~~별 = >그룹
select deptno, avg(sal)
from emp
group by deptno, job;

--구문이 길어지면 순서가 중요해짐
select deptno, avg(sal)
from emp
group by deptno, job
order by deptno, job;

--group by : select 절에 group by 절에 포함안되는 열을 사용 불가
select ename, deptno, avg(sal)
from emp
group by deptno;

--group by ~ having : 그룹을 잡을 때 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal)>=2000;

--where : 출력 대상 행을 제한
--having : 그룹화된 대상을 제한

--emp 테이블의 부서별 직책의 평균급여가 500이상인, 사원들의 부서번호, 직책,
--평균 급여가 출력
select deptno, job, avg(sal)
from emp
group by deptno, job
having avg(sal) >=500
order by deptno, job;

select deptno, job, avg(sal) --:ORA-00934: group function is not allowed here
from emp
where avg(sal)>=500
group by deptno, job;

--실행순서
select deptno, job,avg(sal)--5
from emp --   1
where sal<=3000 --2
group by deptno, job --3
having avg(sal)>=2000 --4
order by deptno, job; --6
--from > where > group by > having by > select > order by 순

--[실습] emp 테이블을 이용하여 부서번호(deptno), 평균급여(avg_sal), 최고 급여(max_sal)
--최저급여(min_sal), 사원수(cnt)를 출력
--단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별 출력
select deptno, round(avg(sal)) as avg_sal, max(sal) as max_sal, min(sal) as min_sal, count(empno) as cnt
from emp
group by deptno;

--[실습] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력
select job, count(*)
from emp
group by job
having count(job)>=3;

--[실습] 사원들의 입사연도(hire_year)를 기준으로 부서별로 몇명이 입사했는지 출력
select to_char(hiredate,'YYYY') as hire_year, deptno, count(*) as cnt
from emp
group by to_char(hiredate,'YYYY'), deptno;

--join
-- 데이터가 여러 개의 테이블에 나뉘어 저장됨
select * 
from emp;

select * 
from dept;

--1)내부조인 : 일치하는 컬럼을 기준으로 값 가져오기
--column ambiguously defined
select e.empno, e.ename, e.deptno, dname, loc --둘다 들어있는 경우에는 확실히 알려주기
from emp e, dept d --연결할 테이블 나열 , 별칭 붙이기
where e.deptno = d.deptno; --조인의 조건

-- 표준문법(inner 생략가능)
select e.empno, e.ename, e.deptno, dname, loc
from emp e inner join dept d on e.deptno = d.deptno;

--부서번호가 일치하는 사원들의 정보 출력
--급여가 3000 이상자만 출력
select e.empno, e.ename, e.deptno, dname, loc
from emp e inner join dept d on e.deptno = d.deptno and sal >=3000;

--부서번호가 일치하는 사원들의 정보 출력
--급여가 2500 이하이고, 사원번호가 9999이하인 사원 출력
select 
e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.sal >=2500 and e.empno<=9999;

--join문
select 
e.empno, e.ename, e.deptno, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno and e.sal >=2500 and e.empno<=9999;

--emp, salgrade 조인 : 비등가 조인
select * from salgrade;

select empno,ename, job,sal,comm,deptno, grade
from emp e join salgrade s on e.sal between s.losal and s.hisal;

--자기자신 테이블 조인 : 셀프 조인
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, emp e2
where e1.mgr = e2.empno;

--outer join(외부조인) : 연결이 안된 것도 가지고 옴.
-- left
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;

--right
select e1.empno, e1.ename, e1.mgr, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;

--[문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원수 출력
--부서 코드, 부서명, 평균급여, 최대급여, 최소급여, 사원수
select d.deptno, d.dname, floor(avg(sal)), max(sal), min(sal),count(*)
from emp e join dept d on e.deptno = d.deptno
group by d.deptno, d.dname;

--[문제] 모든 부서정보와 사원 정보를 출력(부서번호의 오름차순, 사원번호의 오름차순)
--부서번호, 부서명, 사원번호, 사원명, 직책, 급여
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e right outer join dept d on e.deptno = d.deptno
order by d.deptno, e.empno;

--세 개의 테이블 조인
select e1.empno, e2.empno, e3.empno
from emp e1 join emp e2 on e1.empno = e2.empno join emp e3 on e2.empno = e3.empno;

--[문제] 모든 부서정보와 사원 정보, 급여 등급 정보, 각 사원의 직속 상관의 정보 부서번호, 사우너번호 순으로 정렬하여 출력
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno as deptno_1,
s.losal, s.hisal, s.grade, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join dept d on e1.deptno = d.deptno
left outer join salgrade s on e1.sal between s.losal and s.hisal
left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno, e.empno;

--2022.03.22
--서브 쿼리 : 쿼리문 안에 또 다른 쿼리문 존재
--select ㅈ회할 열
--from 테이블명
--where 조건식(select 조회할 열 from 테이블 명 where 조건식)

--JONES 사원의 급여보다 높은 급여를 받는 사원 조회

--JONES 사원의 급여
select sal
from emp
where ename = 'JONES';
--결과값 2975
select *
from emp
where sal > 2975;

--위 두개의 구문을 합한것
select *
from emp
where sal >
     (select sal
      from emp
      where ename = 'JONES');

--ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 정보
select *
from emp
where comm >( select comm from emp where ename = 'ALLEN');

--'WARD' 보다 빨리 입사한 사원정보 조회
select * 
from emp
where hiredate >(select hiredate from emp where ename = 'WARD');

--실행결과가 하나로 나오는 단일행 서브쿼리 사용 연산자
-->,<=,=,<,<>,~=, != 

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
--사원정보와 소속 부서 종보를 조회
select e.empno, e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where d.deptno = 20 and e.sal >(select avg(sal) from emp);

--실행결과가 여러개로 나오는 다중행 서브쿼리 사용 연산자
-- IN, ANY(SOME),ALL, EXISTS
select * 
from emp
where deptno in(20,30);
--in  : 메인 쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 true
 
--각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
select max(sal)
from emp
group by deptno;

--오류
select * 
from emp
where sal = (select max(sal)
          from emp group by deptno);

--in사용
select * 
from emp
where sal in (select max(sal)
          from emp group by deptno);

--any(some) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도 
--true라면 메인 쿼리 조건식을 true로 반환
-- IN == =ANY(크다 작다)
--any
select * 
from emp
where sal = any (select max(sal)
          from emp group by deptno);

--각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
select *
from emp
where sal < any(select max(sal) from emp group by deptno);

--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력
--30번 부서 사원들의 최소급여
--1.min 사용
select min(sal)
from emp
where deptno = 30;
--2. distinct
select distinct sal 
from emp
where deptno = 30;

select * 
from emp
where sal > any (select distinct sal from emp where deptno = 30);

--30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 정보 출력
--ALL : 서브쿼리가 반환한 여러 결과 값을 메인 쿼리의 조건식이 모두 만족시 true
select *
from emp
where sal < all (select distinct sal from emp where deptno = 30);

--다중열 서브쿼리

--자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 출력
select deptno, max(sal)
from emp
group by deptno;

select *
from emp
where(deptno, sal) in (
    select deptno, max(sal)
    from emp
    group by deptno);

--from 절에 사용하는 서브쿼리(인라인뷰)
select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from (select * from emp where deptno = 10) e10,
    (select * from dept) d
where e10.deptno = d.deptno;

--[문제] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 
--사원 정보, 부서정보를 출력(not in)
--30번 부서의 직책 : 3개 출력
select job
from emp
where deptno =30;

select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
from emp e join dept d on e.deptno = d.deptno
where e.deptno = 10 and job not in
           (select job
            from emp
           where deptno =30);
           
--[문제] 직책이 salesman 인 사람들의 최고급여보다 높은 급여를 받는 사원들의 
--사원 정보, 급여 등급 정보를 출력
--EMPNO, ENAME, SAL, GRADE출력
--MAX() 쓰는 형태
select max(sal) from emp where job= 'SALESMAN';

select empno, ename, sal, grade
from emp e join salgrade s on e.sal between s.losal and s.hisal 
where sal> (select max(sal) from emp where job= 'SALESMAN');


--MAX() 안쓰는 형태
select empno, ename, sal, grade
from emp e join salgrade s on e.sal between s.losal and s.hisal 
where sal> all(select sal from emp where job= 'SALESMAN');

-- DML(데이터 조작어 : 삽입, 삭제, 수정) =>최종 반영을 할껀지 안할껀지 여부 
-- commit(커밋) : 데이터베이스에 최종 반영, =>확정 시켜줘
-- rollback(롤백) : 지금 반영된걸 취소 = >아니야 하지마

--DEPT 테이블의 데이터를 복사하여 dept_temp 테이블 생성
create table dept_temp as select * from dept;

--insert(삽입)
--insert into 테이블 명(열이름...)
--values(데이터...)

--문자, 날짜 데이터는 ''사용
insert into dept_temp(deptno, dname,loc)
values(50, 'DATEBASE','SEOUL');

insert into dept_temp
values(60, 'NETWORK','BUSAN');

insert into dept_temp(deptno, dname)
values(70, 'NETWORK');
--생략시 null자동입력

--insert into dept_temp
--values(800, 'NETWORK','BUSAN');
-- 오류 : 테이블을 만들 때 데이터를 어떻게 받을꺼야라고 명시하게 되어있음
--value larger than specified precision allowed for this column
-- 2자리로 했는데 3자리를 넣을꺼야 라고 하면 오류, 형식에 맞춰서 규칙에 맞춰서 입력

insert into dept_temp
values(80, 'NETWORK',null);
--직접 null 사용 가능

select * from dept_temp;

-- emp 테이블의 구조만 복사해서 새로운 테이블 생성
create table emp_temp as select * from emp where 1<>1;

insert into emp_temp(empno,ename, job, mgr, hiredate,sal, comm, deptno)
values(9999,'홍길동' ,'MANAGER',NULL,'2021-01-05',5000,1000,10);

insert into emp_temp(empno,ename, job, mgr, hiredate,sal, comm, deptno)
values(8888,'성춘향' ,'MANAGER',9999,sysdate,4000,500,20);

--emp테이블의 내용을 사원 중 부서번호가 20번인 사원들만 emp_temp 사입
insert into emp_temp(empno,ename, job, mgr, hiredate,sal, comm, deptno)
select empno,ename, job, mgr, hiredate,sal, comm, deptno
from emp
where deptno = 20;


--emp 테이블에서 salgrade 테이블을 참조하여 등급이 1인 사원을 
--emp_temp 추가하고 싶을때
insert into emp_temp(empno,ename, job, mgr, hiredate,sal, comm, deptno)
select empno,ename, job, mgr, hiredate,sal, comm, deptno
from emp e join salgrade s on e.sal between s.losal and s.hisal
where s.grade=1;

select * from emp_temp;

--수정(uppdate)
--update 테이블 명
--set 변경할 열 = 값, 변경할 열 = 값
select * from dept_temp;

--loc를 seoul로 변경
--where를 사용하지 않으면 모두 변경됨.
update dept_temp
set loc='SEOUL';

--deptno=50인 경우 loc를 부산으로 변경
update dept_temp
set loc = 'BUSAN'
where deptno = 50;

--emp_temp 사원 중 sal 3000이하인 사원만 comm 300으로 수정
update emp_temp
set comm = 300
where sal<=3000;
select * from emp_temp;

--update 서브쿼리
--dept 테이블의 부서번호가 40번인 부서명과 지역 추출
update dept_temp
set (dname, loc) = (select dname, loc from dept where deptno=40);

--dname이 operations인 부서번호 추출 : DEPT
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL' 변경
update dept_temp
set loc = 'SEOUL'
where deptno = (select deptno from dept where dname='OPERATIONS');

--empno = 7369인 사원의 sal 1500으로 변경
update emp_temp
set sal = 1500
where empno=7369;

--삭제
--delete [from],[where]
SELECT * FROM emp_temp;

--job이 ANALYST인 사원 삭제
delete from emp_temp
where job= 'ANALYST';
delete emp_temp;

--emp_temp 에서 급여등급이 3이고, 20번 부서의 사원만 삭제
--서브쿼리 형태
delete from emp_temp
where empno in (select empno 
                from emp_temp e join salgrade s on e.sal between s.losal and s.hisal
                where s.grade = 3 and e.deptno=20 );

rollback; --되돌리기

commit; -- 저장 완료.

-- [실습] 기존 테이블을 이용하여 테이블을 생성한다.
--1. emp테이블의 내용을 이용하여 exam_emp 생성
create table exam_emp as select * from emp;

--2. dept 테이블의 내용을 이용하여 exam_dept 생성
create table exam_dept as select * from dept;

--3. salgrade 테이블의 내용을 이용하여 exam_salgrade 생성
create table exam_salgrade as select * from salgrade;

--[실습2] 정보를 exam_emp 테이블에 입력
insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL,50);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,NULL,60);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL,70);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL,70);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL,80);

insert intO exam_emp (empno, ename, job,mgr,hiredate,sal,comm,deptno)
values(7208,'TEST_USER8','CLERK',7201,'2016-03-09',1200,NULL,80);

select * from exam_emp;

--[실습3] exam_emp에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다
--많은 급여를 받고 있는 사원들을 70번 부서로 변경
--50번 부서의 평균 급여
select avg(sal) from exam_emp where deptno=50;
update exam_emp
set deptno=70
where sal > (select avg(sal) from exam_emp where deptno=50);

--[실습4] exam_emp에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 
--늦게 입사한 급여를 10%인상하고 80번 부서로 변경
update exam_emp
set sal = sal *1.1, deptno = 80
where hiredate > (select min(hiredate) from exam_emp where deptno =60);

--[실습5] exam_emp에 속한 사원 중, 급여 등급이 5인 사원을 삭제
delete from exam_emp
where empno in(select empno
              from exam_emp e join exam_salgrade s on e.sal between s.losal and s.hisal
              where s.grade =5);     

SELECT
    *
FROM
    exam_emp;

COMMIT;


--2022-03-24
-- 트랜잭션 : 관계형 데이터베이스에서 하나의 작업 또는 밀접하게 관련되어 있는
-- 작업수행을 위해 나눌 수 없는 최소 수행 단위

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;

select * from dept_tcl;

---- 트랜잭션과 관련있는 명령어
insert into dept_tcl values(50,'DATABASE','SEOUL');
update dept_tcl set loc='BUSAN' where deptno=40;
delete from dept_tcl where dname='RESEARCH';

------------------- 하나의 트랜잭션

rollback;

commit;

-- 세션(session) : 어떤 활동을 위한 시간이나 기간 
-- 데이터베이스 세션 : 데이터베이스 접속을 시작으로 여러 데이터베이스에서 작업을 수행한 후 접속 종료

delete from dept_tcl where deptno=50;
commit;


update dept_tcl set loc='SEOUL'
where deptno=30;

commit;

-- DDL(데이터 정의어) : 객체 생성(CREATE),변경(ALTER),삭제(DROP)

-- 테이블 생성
--CREATE TABLE 테이블명(
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형,
--    열이름 자료형);

-- 테이블명 규칙
-- 문자로 시작
-- 같은 사용자 소유의 테이블명 중복 불가
-- 영문자(한글 가능), 특수문자 가능($, #, _)
-- SQL 키워드(SELECT, DELETE...)는 테이블명 사용 불가

-- 자료형
-- 문자 :  n= 길이를의미
-- CHAR(n) - 고정길이 ex) name char(10); => 3 => 10
-- VARCHAR2(n) -- 가변길이  ex) name varchar2(10); => 3 
-- NCHAR(n) -- 고정길이(유니코드) ex) name nchar(10); 한글/영어 모두 10개의 문자
-- NVARCHAR(n) -- 가변길이(유니코드) 

-- 숫자형
-- NUMBER(숫자1,숫자2) : 숫자1(자릿수), 숫자2(소수점자릿수)
--  ex) empno number(4) : 숫자로 4자리 허용
--      price number(7,2) : 숫자로 7자리 허용되는데 소수점이 들어온다면 2자리 허용
--      job number : 저장 데이터 크기에 맞게 자동 조절

-- 날짜형
-- DATE : 년,월,일,시,분,초
-- TIMESTAMP : 년,월,일,시,분,초 + 밀리초 입력가능


-- 테이블 생성
-- 구조 설계(필드명, 길이 등)
create table emp_ddl (
     empno NUMBER(4),
     ename VARCHAR2(10),
     job VARCHAR2(9),
     mgr NUMBER(4),
     hiredate DATE,
     sal NUMBER(7, 2),
     comm NUMBER(7, 2),
     deptno NUMBER(2) );

drop table emp_ddl;

-- 다른 테이블 구조 이용해서 생성(데이터까지 포함)
create table emp_ddl as select * from emp;

-- 다른 테이블 구조만 이용해서 생성(데이터값은 없음)
create table emp_ddl1 as select * from emp where 1<>1;


-- 테이블 변경 : ALTER
SELECT * FROM emp_ddl;

-- 열(컬럼) 추가 : ADD
alter table emp_ddl ADD hp varchar2(20);

-- 열 이름을 변경 : RENAME
alter table emp_ddl rename column hp to tel;

-- 열 자료형 변경 : MODIFY
alter table emp_ddl modify empno number(5);
desc emp_ddl;

-- 데이터가 삽입되어 있을 때는 데이터의 길이와 맞지 않는다면 변경 불가
-- alter table emp_ddl modify empno number(3);

-- 열 삭제 : DROP COLUMN
alter table emp_ddl drop column tel;

-- 테이블 명 변경 : RENAME 
RENAME emp_ddl TO emp_rename;


-- 테이블 삭제 : drop
DROP TABLE emp_rename;

-- [문제] emp_hw 테이블 생성
create table emp_hw(
    id char(8),
    name varchar2(10),
    addr varchar2(50),
    nation char(4),
    email varchar(50),
    age number(7,2)
);
 -- 구조확인
desc emp_hw;

alter table emp_hw add bigo varchar2(20);
alter table emp_hw modify bigo  varchar2(30);
alter table emp_hw rename column bigo to remark;

-- 제약조건(테이블의 특정 열에 지정)
-- 입력,수정,삭제 영향을 주는 부분  => 데이터의 무결성(정확성,일관성) 유지

-- 1) NOT NULL : 지정한 열에 NULL 을 허용하지 않음
-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NULL 제외)
-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능

-- NOT NULL 제약조건
CREATE TABLE table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
 
--cannot insert NULL into 오류 생성.제약 조건시 데이터 삽입부터 영향
--데이터가 안 들어 오는 걸 막아냄   
insert into table_notnull(login_id, login_pwd, tel)
values('test_id_01',null,'010-1234-5678');
    
insert into table_notnull(login_id, tel)
values('test_id_01','010-1234-5678'); 

--성공, tel은 없어도 가능
insert into table_notnull(login_id, login_pwd)
values('test_id_01','12345');

-- cannot update 오류. 입력, 수정도 영향이 있음
update table_notnull
set login_pwd = NULL
where login_id = 'test_id_01';

-- scott 가 사용한 모든 제약조건 확인
select * from user_constraints;

-- 제약조건명 지정
CREATE TABLE table_notnull2(
    login_id varchar2(20) constraint tblnn2_lgnid_nn not null,
    login_pwd varchar2(20) constraint tblnn2_lgnpwd_nn not null,
    tel varchar2(20));

-- table_notnull tel 컬럼을 not null 제약 조건 추가
desc table_notnull;
select * from table_notnull;
--무조건 변경해주는게 아니고 이미 기존의 값이 mull이기 때문에 not null로 변경 할 수 없음.
--값을 업데이트 후 다시 not null로 변경
alter table table_notnull modify(tel not null);

update table_notnull
set tel='010-1234-5678'
where login_id='test_id_01';

-- 제약조건 이름 변경
alter table table_notnull2 rename constraint tblnn2_lgnid_nn to tblnn2_id_nn;

-- 제약조건 삭제
alter table table_notnull2 drop constraint tblnn2_id_nn;

-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야 함(NULL 제외)
CREATE TABLE table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

insert into table_unique(login_id, login_pwd, tel)
values('test_id_01','12345','010-1234-5678');

-- unique constraint violated. 아이디가 중복 되면 안되는데 중복되서 오류
insert into table_unique(login_id, login_pwd, tel)
values('test_id_01','54321','010-5678-1234');

--null은 중복값에 해당 되지 않음.
insert into table_unique(login_id, login_pwd, tel)
values(null,'54321','010-5678-1234');

-- unique 제약조건 이름 지정
CREATE TABLE table_unique2(
    login_id varchar2(20) constraint tblunq2_lgnid_unq  unique,
    login_pwd varchar2(20) constraint tblunq2_lgnpwd_nn  not null,
    tel varchar2(20)
);

-- table_unique2 의 tel unique 제약조건 추가
--전화번호도 중복되면 안됨. 단, null은 허용
alter table table_unique2 modify(tel unique);

-- 3) PRIMARY KEY : 지정한 열이 유일값이면서 NULL이 아님(하나만 지정)
-- not null + unique
-- 각 행을 식별하는 용도(행과 행을 구분)

CREATE TABLE table_pk(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) not null,
    tel varchar2(20));
    
insert into table_pk values('test_01','pw01','010-1234-5678');
-- unique constraint violated. null이 아닌건 만족, 값이 중복.
insert into table_pk values('test_01','pw01','010-1234-5678');

-- table can have only one primary key 
CREATE TABLE table_pk2(
    login_id varchar2(20) primary key,
    login_pwd varchar2(20) primary key,
    tel varchar2(20));

--이름지정
CREATE TABLE table_pk2(
    login_id varchar2(20) constraint tblpk2_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblpk2_lgnpwd_nn not null,
    tel varchar2(20));

-- 제약조건 지정시 다른 방식
CREATE TABLE table_con(
    col1 varchar2(20),
    col2 varchar2(20),
    primary key(col1),
    constraint tblcon_unq unique(col2));

-- 4) FOREIGN KEY(외래키) : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
create table dept_fk(
    deptno number(2) constraint deptfk_deptno_pk primary key,
    dname varchar2(20),
    loc varchar2(13));

--외래키 부분 references dept_fk(deptno) : 어느테이블에 어느필드명을 참조할 것인지
create table emp_fk(
    empno number(4) constraint empfk_empno_pk primary key,
    ename varchar2(10),
    deptno number(2) constraint empfk_deptno_fk references dept_fk(deptno));

-- parent key not found : 부모키가 없다. 외래키를 걸면 부모 자식 관계 생성
--dept_fk 부, emp_fk : 자식 부모 값에 값이 없어서 찾을 수 없다는 메세지.
insert into emp_fk(empno,ename,deptno)
values(7899,'hong',20);

-- 외래키 수행순서
-- 부모테이블에 데이터가 먼저 삽입되어야 함
-- 자식테이블 데이터 삽입
-- 외래키는 순서가 있고 부모부터 들어가고 자식이 들어가야함.

insert into dept_fk values(10,'DATABASE','SEOUL');
insert into emp_fk(empno,ename,deptno)
values(7899,'hong',10);

-- child record found : 자식 값이 있어서 오류
DELETE FROM dept_fk WHERE deptno=10;

-- 외래키 삭제 수행 순서
-- 자식 테이블에 해당하는 데이터 삭제
-- 부모 테이블에 해당하는 데이터 삭제

DELETE FROM EMP_FK WHERE deptno=10;
DELETE FROM dept_fk WHERE deptno=10;

-- 부모 데이터를 삭제할 때 참조하고 있는 데이터도 함께 삭제
-- 부모 데이터를 삭제할 때 참조하고 있는 데이터를 null 로 수정
create table dept_fk2(
    deptno number(2) constraint deptfk2_deptno_pk primary key,
    dname varchar2(20),
    loc varchar2(13));

-- ON DELETE CASCADE : 열 데이터 삭제시 참조 데이터 함께 삭제
create table emp_fk2(
    empno number(4) constraint empfk2_empno_pk primary key,
    ename varchar2(10),
    deptno number(2) constraint empfk2_deptno_fk references dept_fk2(deptno) 
    ON DELETE CASCADE);

insert into dept_fk2 values(10,'DATABASE','SEOUL');
insert into emp_fk2(empno,ename,deptno)
values(7899,'hong',10);

DELETE FROM dept_fk2 where deptno=10;

select * from emp_fk2;

-- ON DELETE SET NULL : 열 데이터 삭제시 참조 데이터를 NULL로 수정
create table dept_fk3(
    deptno number(2) constraint deptfk3_deptno_pk primary key,
    dname varchar2(20),
    loc varchar2(13));

create table emp_fk3(
    empno number(4) constraint empfk3_empno_pk primary key,
    ename varchar2(10),
    deptno number(2) constraint empfk3_deptno_fk references dept_fk3(deptno) 
    ON DELETE SET NULL);

insert into dept_fk3 values(10,'DATABASE','SEOUL');
insert into emp_fk3(empno,ename,deptno)
values(7899,'hong',10);

DELETE FROM dept_fk3 where deptno=10;

select * from emp_fk3;
select * from DEPT_Fk3;

-- 5) CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능
--length 오라클에서 지원하는 함수
CREATE TABLE tbl_check(
    login_id varchar2(20) constraint tblck_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblck_lgnpwd_ck check (length(login_pwd) > 3),
    tel varchar2(20));

-- check constraint  violated : 조건이 비밀번호 3자리 이상인데 3자리 넣어서 오류
insert into tbl_check values('test_id1','123','010-1234-5678');

insert into tbl_check values('test_id1','1234','010-1234-5678');


-- 기본값 지정 : default

CREATE TABLE tbl_default(
    login_id varchar2(20) constraint tbl_lgnid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));

insert into tbl_default values('test_id1',null,'010-1234-5678');

select * from tbl_default;

--nulld을 입력하면 null출력.값을 명시하지 않았을 때 기본값을 설정해둠.
insert into tbl_default(login_id,tel) values('test_id2','010-1234-5678');


-- [문제] dept_const 테이블 생성
create table dept_const(
    deptno number(2) constraint deptconst_deptno_pk primary key,
    dname varchar2(14) constraint deptconst_deptno_unq unique,
    loc varchar2(13) constraint deptconst_loc_nn not null);

--create table dept_const(
--    deptno number(2),
--    dname varchar2(14),
--    loc varchar2(13),
--    constraint deptconst_deptno_pk primary key(deptno),
--    constraint deptconst_deptno_unq unique(dname),
--    constraint deptconst_loc_nn not null(loc));


-- [문제] emp_const 생성
create table emp_const(
    empno number(2) constraint empconst_empno_pk primary key,
    ename varchar2(10) constraint empconst_ename_nn not null,
    job varchar2(9),
    tel varchar2(20) constraint empconst_tel_unq unique,
    hiredate date,
    sal number(7,2) constraint empconst_sal_chk check(sal between 1000 and 9999),
    comm number(7,2),
    deptno number(2) constraint empconst_deptno_fk references dept_const(deptno));

commit;


--2022.03.25
--시퀀스(sequence) : 규칙에 따라 순번을 생성, 단독 객체

--1씩 증가
create sequence dept_seq;

create table dept_sequence as select * from dept where 1<>1;

select * from dept_sequence;

insert into dept_sequence(deptno, dname, loc)
values(dept_seq.nextval,'DATEBASE','SEOUL');

--가장 마지막으로 생성된 시퀀스 확인
select dept_seq.currval from dual;

--시퀀스 삭제
drop sequence dept_seq;

create sequence dept_seq
increment by 10 -- 시퀀스에서 생성할 번호의 증가값
start with 10 --시퀀스에서 생성할 번호의 시작값
maxvalue 90 -- 시퀀스에서 생성할 번호의 최댓값
minvalue 0  -- 시퀀스에서 생성할 번호의 최소값
nocycle --시퀀스에서 생성한 번호가 최댓값에 도달 할 경우 다시 시작 할 것인가 여부(cycle or nocycle)
cache 2; --시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

insert into dept_sequence(deptno, dname, loc)
values(dept_seq.nextval,'DATEBASE','SEOUL');
--여러번 반복해서 시퀀스 입력하면 오류 : sequence DEPT_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated

select * from dept_sequence;

--시퀀스 수정
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

--뷰(view) : 가상 테이블
--           하나 이상의 테이블을 조회하는 select 문을 저장한 객체
--           편리성 -- select 문의 복잡도를 완화
--           보완성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

--뷰 생성
create view vm_emp20 as (select empno, ename, job, deptno from emp where deptno = 20);

select * from vm_emp20;

--insert
insert into vm_emp20(empno,ename,job,deptno)
values(8000,'TEST','MANAGER',20);
select * from vm_emp20;

--view와 원본 테이블 연결 여부
select * from emp;

--생성된 뷰들의 속성 확인하기
select * 
from USER_UPDATABLE_COLUMNS
where table_name = 'VM_EMP20';

--뷰 생성시 원본 데이터 수정 불가하도록 작성
create view vm_emp_read as select empno, ename,job from emp with read only; 
select * 
from USER_UPDATABLE_COLUMNS
where table_name = 'VM_EMP_READ';

insert into vm_emp_read(empno,ename,job)
values(8001,'TEST','MANAGER');

--뷰 삭제
drop view vm_emp20;

--인덱스 : 빠른 검색.찾고 싶은 데이터를 빨리 찾게 해줌
--인덱스 사용 여부에 따라 Table Full Scan, Index Scan

--scott 가 가지고 있는 인덱스 확인하기
select * from user_indexes;--pk 설정된 값들은 인덱스로 사용됨

--인덱스 생성
--create index 인덱스명 on 테이블명(열이름1 asc, 열이름2 desc, ...)
create index idx_emp_sal on emp(sal);

--index가 설정된 컬럼 조회
select * from user_ind_columns;

select * from emp where deptno=20;

--index 삭제
drop index idx_emp_sal;