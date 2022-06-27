--scott 비밀번호 TIGER
-- dept 테이블 정보(부서정보-부서번호, 부서명, 위치)
DESC dept;

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
    
-- emp 테이블에서 ename,sal 조회할 때 sal 오름차순 조회
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;  -- 기본 정렬값이 오름차순(ASC)
    
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

-- 문자도 대소비교 연산자가 가능
--ENAME 'F' 이상인 사원 조회(사원 이름의 첫 문자가 F와 같거나 뒤쪽인 사원 조회)

SELECT
    *
FROM
    emp
WHERE
    ename >= 'F'; --문자도 대소비교가 가능함.
    
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
    
    
--2022.03.18    
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

--컬럼명 다르게 해보기. 출력가능    
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
    mgr,
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
    emp
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
SELECT
    '010-1234-5678'                    AS replace_before,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

--문자열 연결 : CONCAT(문자1,문자2)
SELECT
    concat(empno, ename)
FROM
    emp;

SELECT
    concat(empno, concat(':', ename))
FROM
    emp;

    
--문자열 연결 : ||
SELECT
    empno || ename
FROM
    emp;

SELECT
    empno
    || ':'
    || ename
FROM
    emp;

-- 문자열 공백 : TRIM(), LTRIM(), RTRIM()
-- 특정 문자열 제거(아무것도 안주면 공백제거) : TRIM(), LTRIM(), RTRIM()
SELECT
    '   이것이   ',
    TRIM('   이것이   '),
    ltrim('   이것이   '),
    rtrim('   이것이   ')
FROM
    dual;

   
   
 --2022.03.21 월요일   
--숫자함수
--round() : 반올림, trunc() : 버림,
--ceil() : 지정된 숫자보다 큰 정수중에서 가장 작은 정수
--floor() : 지정된 숫자보다 작은 정수 중에서 가장 큰 정수
--mod() : 나머지

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round1,
    round(1234.5678, 1)   AS round2,
    round(1234.5678, 2)   AS round3,
    round(1234.5678, - 1) AS round4,
    round(1234.5678, - 2) AS round5
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc1,
    trunc(1234.5678, 1)   AS trunc2,
    trunc(1234.5678, 2)   AS trunc3,
    trunc(1234.5678, - 1) AS trunc4,
    trunc(1234.5678, - 2) AS trunc5
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜 함수 : 연산이 가능함
-- sysdate,current_date, current_timestamp

SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;
    

-- add_months() : 몇 개월 이후 날짜 구하기
SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;
    

-- 입사 20주년이 되는 사원들 조회
SELECT
    empno,
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
-- 현재 날짜를 기준으로 입사 45년 미만인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    add_months(hiredate, 540) > sysdate;


-- months_between(날짜1,날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(hiredate, sysdate)        AS months1,
    months_between(sysdate, hiredate)        AS months2,
    trunc(months_between(sysdate, hiredate)) AS months3
FROM
    emp;

--next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
--last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력
SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

--형변환 함수
SELECT
    empno,
    ename,
    empno + '500'
FROM
    emp
WHERE
    ename = 'SMITH';

DESC emp;

SELECT
    empno,
    ename,
    'abcd' + empno
FROM
    emp
WHERE
    ename = 'SMITH';

-- TO_CHAR() : 숫자, 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM
    dual;

SELECT
    to_char(sysdate, 'MM')    AS mm,
    to_char(sysdate, 'MON')   AS mon,
    to_char(sysdate, 'MONTH') AS month,
    to_char(sysdate, 'DD')    AS dd,
    to_char(sysdate, 'DY')    AS dy,
    to_char(sysdate, 'DAY')   AS day
FROM
    dual;

SELECT
    to_char(sysdate, 'HH24:MI:SS')    AS hh24miss,  --24시간제
    to_char(sysdate, 'HH24:MI:SS AM') AS hhmiss_am,
    to_char(sysdate, 'HH:MI:SS P.M.') AS hhmiss_pm,
    to_char(sysdate, 'HH:MI:SS')      AS hhmiss   -- 12시간
FROM
    dual;

--TO_NUMBER
SELECT
    1300 - '1500',
    '1300' + 1500
FROM
    dual;

SELECT
    '1,300' + '1,500'
FROM
    dual;
    

--9 : 숫자 한자리를 의미함
SELECT
    to_number('1,300', '999,999') + to_number('1,500', '999,999')
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$
FROM
    emp;

--문자데이터를 날짜 형식으로 변환
SELECT
    TO_DATE('2022-03-22', 'YYYY-MM-DD') AS date1,
    TO_DATE('20220322', 'YYYY-MM-DD')   AS date2
FROM
    dual;

--1981년 6월 1일 이후에 입사한 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('19810601', 'YYYY-MM-DD');

--null 처리 함수
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

--nvl(널값 열, 널인 경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

--nvl2(널값 열, 널이 아닐 경우 사용할 값, 널인 경우 사용할 값)
SELECT
    empno,
    ename,
    sal,
    nvl2(comm, 'O', 'X'),
    sal + nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;


--DCODE 함수와 CASE문
--decode(대상이 될 열 혹은 데이터,
--    조건1, 조건1과 일치시 반환할 결과
--    조건2, 조건2와 일치시 반환할 결과
--    else,defult에 해당) 조건1 ~조건 n까지 만족안할 때 반환할 결과
--)

--job에 따라 비율을 다르게 준 다음 연산
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ALALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

-- case문
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ALALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

--case문 변형 
SELECT
    empno,
    ename,
    job,
    sal,
    CASE
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 :' || comm
    END AS comm_text
FROM
    emp;
    
--[실습1] emp 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
--하루 근무시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 
--시급(TIME_PAY)를 계산하여 결과를 출력한다.
-- 단, 하루 급여는 수소점 세째자리에서 버리고, 시급은 두번째 소수점에서 반올림

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

--[실습2] emp 테이블에서 사원들은 입사일(hiredate)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다
--사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 M/A로 출력
SELECT
    comm,
    nvl(comm, 'N/A') -- 에러 발생
FROM
    emp;

SELECT
    comm,
    nvl(to_char(comm), 'N/A')
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm
FROM
    emp;


--[실습3] emp 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(mgr)를
--다음과 같은 조건을 기준으로 변환해서 CHG_MGR열에 출력
--mgr 존재하지 않으면 0000
--mgr 75인 경우 : 5555
--mgr 76인 경우 : 6666
--mgr 77인 경우 : 7777
--mgr 78인 경우 : 8888
-- 그 외 원래대로 mgr 출력

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

--다중행 함수 : 여러개를 묶어서 한번에 해결
-- sum(),count(), max(), min(), avg()

--추가수당 합계
--null은 카운트 되지 않음
SELECT
    SUM(comm)
FROM
    emp;

SELECT
    SUM(DISTINCT sal),
    SUM(sal)
FROM
    emp;
    

--emp 테이블 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp;

--부서번호가 30번인 사원 수 출력
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 30;

--max,min
--급여의 최대값
SELECT
    MAX(sal)
FROM
    emp;

--급여의 최소값
SELECT
    MIN(sal)
FROM
    emp;

--부서번호가 20번인 사원 중 제일 오래된 입사일 구하기
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

--부서번호가 20번인 사원 중 가장 최근 입사일 구하기
SELECT
    MAX(hiredate)
FROM
    emp
WHERE
    deptno = 20;

--평균 avg
--부서번호가 30번인 사원들의 급여 평균출력
SELECT
    round(AVG(sal))
FROM
    emp
WHERE
    deptno = 30;


-- 부서별 평균 급여 출력 : group by 

SELECT
    deptno,
    AVG(sal)  -- ORA-00937: not a single-group group function
FROM
    emp;

-- group by  : 결과값을 원하는 열로 묶어 출력
--부서별 급여의 평균을 알고 싶음
SELECT
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

--부서별, 직책별 급여 평균 출력
--~~별 = >그룹
--구문이 길어지면 순서가 중요해짐
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

--group by : select 절에 group by 절에 포함안되는 열을 사용 불가
SELECT
    ename,
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno;

--group by ~ having : 그룹을 잡을 때 조건을 주는 경우

-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000;

--where : 출력 대상 행을 제한
--having : 그룹화된 대상을 제한

--emp 테이블의 부서별 직책의 평균급여가 500이상인, 사원들의 부서번호, 직책,
--평균 급여가 출력

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 500
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    AVG(sal) >= 500 -- group function is not allowed here
GROUP BY
    deptno,
    job;

--실행순서
SELECT         -----------------------  ⑤
    deptno,
    job,
    AVG(sal)
FROM           ---------------  ① 
    emp
WHERE          ---------------  ② 
    sal <= 3000
GROUP BY       ---------------  ③
    deptno,
    job
HAVING         ---------------  ④
    AVG(sal) >= 2000
ORDER BY       ----------------------  ⑥
    deptno,
    job;
--from > where > group by > having by > select > order by 순

--[실습] emp 테이블을 이용하여 부서번호(deptno), 평균급여(avg_sal), 최고 급여(max_sal)
--최저급여(min_sal), 사원수(cnt)를 출력
--단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별 출력
SELECT
    deptno,
    round(AVG(sal)) AS avg_sal,
    MAX(sal)        AS max_sal,
    MIN(sal)        AS min_sal,
    COUNT(empno)    AS cnt
FROM
    emp
GROUP BY
    deptno;

--[실습] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

--[실습] 사원들의 입사연도(hire_year)를 기준으로 부서별로 몇명이 입사했는지 출력
SELECT
    to_char(hiredate, 'YYYY') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'YYYY'),
    deptno;

--join
-- 데이터가 여러 개의 테이블에 나뉘어 저장됨

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    dept;

--1)내부조인 : 일치하는 컬럼을 기준으로 값 가져오기
--column ambiguously defined
--오류
SELECT
    empno,
    ename,
    deptno,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno;
    
--오류 수정
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc  --둘다 들어있는 경우에는 확실히 알려주기
FROM
    emp  e,
    dept d --연결할 테이블 나열 , 별칭 붙이기
WHERE
    e.deptno = d.deptno;  --조인의 조건

-- 표준문법(inner 생략가능)
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;

--부서번호가 일치하는 사원들의 정보 출력
--급여가 3000 이상자만 출력
SELECT
    e.empno,
    e.ename,
    e.deptno,
    dname,
    loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno
                         AND sal >= 3000;

--부서번호가 일치하는 사원들의 정보 출력
--급여가 2500 이하이고, 사원번호가 9999이하인 사원 출력
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND e.sal >= 2500
    AND e.empno <= 9999;

--join문
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
                   AND e.sal >= 2500
                   AND e.empno <= 9999;

--emp, salgrade 조인 : 비등가 조인
SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    job,
    sal,
    comm,
    deptno,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

--자기자신 테이블 조인 : 셀프 조인
SELECT
    *
FROM
    emp;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

--outer join(외부조인) : 연결이 안된 것도 가지고 옴.
-- left
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

--right
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

--[문제] 각 부서별 평균급여, 최대급여, 최소급여, 사원수 출력
--부서 코드, 부서명, 평균급여, 최대급여, 최소급여, 사원수
SELECT
    d.deptno,
    d.dname,
    floor(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
GROUP BY
    d.deptno,
    d.dname;

--[문제] 모든 부서정보와 사원 정보를 출력(부서번호의 오름차순, 사원번호의 오름차순)
--부서번호, 부서명, 사원번호, 사원명, 직책, 급여
SELECT
    d.deptno,
    d.dname,
    e.empno,
    e.ename,
    e.job,
    e.sal
FROM
    emp  e
    RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY
    d.deptno,
    e.empno;

--세 개의 테이블 조인
SELECT
    e1.empno,
    e2.empno,
    e3.empno
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e2.empno = e3.empno;

--[문제] 모든 부서정보와 사원 정보, 급여 등급 정보, 각 사원의 직속 상관의 정보 부서번호,
-- 사원번호 순으로 정렬하여 출력
SELECT
    d.deptno,
    d.dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    e1.deptno AS deptno_1,
    s.losal,
    s.hisal,
    s.grade,
    e2.empno  AS mgr_empno,
    e2.ename  AS mgr_ename
FROM
    emp      e1
    RIGHT OUTER JOIN dept     d ON e1.deptno = d.deptno
    LEFT OUTER JOIN salgrade s ON e1.sal BETWEEN s.losal AND s.hisal
    LEFT OUTER JOIN emp      e2 ON e1.mgr = e2.empno
ORDER BY
    d.deptno,
    e1.empno;



--2022.03.22
--서브 쿼리 : 쿼리문 안에 또 다른 쿼리문 존재
--select 조회할 열
--from 테이블명
--where 조건식(select 조회할 열 from 테이블 명 where 조건식)

--JONES 사원의 급여보다 높은 급여를 받는 사원 조회

--JONES 사원의 급여
SELECT
    sal
FROM
    emp
WHERE
    ename = 'JONES'; 
-- 결과값 : 2975

SELECT
    *
FROM
    emp
WHERE
    sal > 2975;

--위 두개의 구문을 합한것
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'JONES'
    );
    

--ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 정보
SELECT
    *
FROM
    emp
WHERE
    comm > (
        SELECT
            comm
        FROM
            emp
        WHERE
            ename = 'ALLEN'
    );

--'WARD' 보다 빨리 입사한 사원정보 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate < (
        SELECT
            hiredate
        FROM
            emp
        WHERE
            ename = 'WARD'
    );

--실행결과가 하나로 나오는 단일행 서브쿼리 사용 연산자
-->,<=,=,<,<>,~=, != 

--20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는
--사원정보와 소속 부서 정보를 조회
SELECT
    e.empno,
    e.ename,
    e.job,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        d.deptno = 20
    AND e.sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );

--실행결과가 여러개로 나오는 다중행 서브쿼리 사용 연산자
-- IN, ANY(SOME),ALL, EXISTS
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 20, 30 );

--IN  : 메인 쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 true 
--각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
--in사용
SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

--오류
SELECT
    *
FROM
    emp
WHERE
    sal = (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );


-- ANY(SOME) : 서브쿼리가 반환한 여러 결과 값 중에서 메인쿼리의 조건식 중 하나라도 
-- TRUE라면 메인 쿼리 조건식을 true로 반환

-- IN == =ANY(크다 작다)
--any
SELECT
    *
FROM
    emp
WHERE
    sal = ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );    

--각 부서별 최고 급여보다 작은 급여를 받는 사원 정보 출력
SELECT
    *
FROM
    emp
WHERE
    sal < ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );    



--30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력

--1.min 사용
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 30;
--2. distinct
SELECT DISTINCT
    sal
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );


--ALL : 서브쿼리가 반환한 여러 결과 값을 메인 쿼리의 조건식이 모두 만족시 true
--30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 정보 출력

SELECT
    *
FROM
    emp
WHERE
    sal < ALL (
        SELECT DISTINCT
            sal
        FROM
            emp
        WHERE
            deptno = 30
    );   

 
--다중열 서브쿼리
--자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 출력
SELECT
    deptno,
    MAX(sal)
FROM
    emp
GROUP BY
    deptno;

SELECT
    *
FROM
    emp
WHERE
    ( deptno, sal ) IN (
        SELECT
            deptno, MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

-- FROM 절에 사용하는 서브쿼리(인라인뷰)
SELECT
    e10.empno,
    e10.ename,
    e10.deptno,
    d.dname,
    d.loc
FROM
    (
        SELECT
            *
        FROM
            emp
        WHERE
            deptno = 10
    ) e10,
    (
        SELECT
            *
        FROM
            dept
    ) d
WHERE
    e10.deptno = d.deptno;

--[문제] 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 
--사원 정보, 부서정보를 출력(not in)
--30번 부서의 직책 : 3개 출력
SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno,
    d.dname,
    d.loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        e.deptno = 10
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 30
    );
           
--[문제] 직책이 salesman 인 사람들의 최고급여보다 높은 급여를 받는 사원들의 
--사원 정보, 급여 등급 정보를 출력
--EMPNO, ENAME, SAL, GRADE출력

--MAX() 쓰는 형태
SELECT
    empno,
    ename,
    sal,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );


--MAX() 안쓰는 형태
SELECT
    empno,
    ename,
    sal,
    grade
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE
    sal > ALL (
        SELECT
            sal
        FROM
            emp
        WHERE
            job = 'SALESMAN'
    );

-- DML(데이터 조작어 : 삽입, 삭제, 수정) =>최종 반영을 할껀지 안할껀지 여부 
-- commit(커밋) : 데이터베이스에 최종 반영, =>확정 시켜줘
-- rollback(롤백) : 지금 반영된걸 취소 = >아니야 하지마

--DEPT 테이블의 데이터를 복사하여 dept_temp 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

--insert(삽입)
--insert into 테이블 명(열이름...)
--values(데이터...)

--문자, 날짜 데이터는 ''사용
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

SELECT
    *
FROM
    dept_temp;

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    70,
    'NETWORK'
);
--생략시 null자동입력

--insert into dept_temp
--values(800, 'NETWORK','BUSAN');
-- 오류 : 테이블을 만들 때 데이터를 어떻게 받을꺼야라고 명시하게 되어있음
--value larger than specified precision allowed for this column
-- 2자리로 했는데 3자리를 넣을꺼야 라고 하면 오류, 형식에 맞춰서 규칙에 맞춰서 입력

INSERT INTO dept_temp VALUES (
    80,
    'NETWORK',
    NULL
);
--직접 null 사용 가능

SELECT
    *
FROM
    dept_temp;

-- emp 테이블의 구조만 복사해서 새로운 테이블 생성
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;
            
SELECT
    *
FROM
    emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    '홍길동',
    'MANAGER',
    NULL,
    '2021-01-05',
    5000,
    1000,
    10
);

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    8888,
    '성춘향',
    'MANAGER',
    9999,
    sysdate,
    4000,
    500,
    20
);

--emp테이블의 내용을 사원 중 부서번호가 20번인 사원들만 emp_temp 사입
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
        emp
    WHERE
        deptno = 20;


--emp 테이블에서 salgrade 테이블을 참조하여 등급이 1인 사원을 
--emp_temp 추가하고 싶을때
INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
)
    SELECT
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno
    FROM
             emp e
        JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
    WHERE
        s.grade = 1;

SELECT
    *
FROM
    emp_temp;


--수정(uppdate)
--update 테이블 명
--set 변경할 열 = 값, 변경할 열 = 값
-- [where] 선택

SELECT
    *
FROM
    dept_temp;

--loc를 seoul로 변경
--where를 사용하지 않으면 모두 변경됨.
UPDATE dept_temp
SET
    loc = 'SEOUL';

rollback;

--deptno=50인 경우 loc를 부산으로 변경
UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 50;


-- EMP_TEMP 사원 중 SAL 3000이하인 사원만 COMM 300 으로 수정
UPDATE emp_temp
SET
    comm = 300
WHERE
    sal <= 3000;

SELECT
    *
FROM
    emp_temp;
    
commit;

--update 서브쿼리
--dept 테이블의 부서번호가 40번인 부서명과 지역 추출
UPDATE dept_temp
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept
        WHERE
            deptno = 40
    );

--dname이 operations인 부서번호 추출 : DEPT
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL' 변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'OPERATIONS'
    );

-- EMPNO=7369인 사원의 SAL 1500으로 변경
UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 7369;


-- 삭제
-- DELETE [FROM]
-- [WHERE]


SELECT
    *
FROM
    emp_temp;

--job이 ANALYST인 사원 삭제
DELETE FROM emp_temp
WHERE
    job = 'ANALYST';

DELETE emp_temp;

--emp_temp 에서 급여등급이 3이고, 20번 부서의 사원만 삭제
--서브쿼리 형태

DELETE FROM emp_temp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 emp_temp e
            JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
                s.grade = 3
            AND e.deptno = 20
    );

ROLLBACK; --되돌리기

COMMIT; -- 저장 완료.

-- [실습] 기존 테이블을 이용하여 테이블을 생성한다.
--1. emp테이블의 내용을 이용하여 exam_emp 생성
CREATE TABLE exam_emp
    AS
        SELECT
            *
        FROM
            emp;
            
SELECT
    *
FROM
    exam_salgrade;

--2. dept 테이블의 내용을 이용하여 exam_dept 생성
CREATE TABLE exam_dept
    AS
        SELECT
            *
        FROM
            dept;


--3. salgrade 테이블의 내용을 이용하여 exam_salgrade 생성
CREATE TABLE exam_salgrade
    AS
        SELECT
            *
        FROM
            salgrade;

--[실습2] 정보를 exam_emp 테이블에 입력
INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7201,
    'TEST_USER1',
    'MANAGER',
    7788,
    '2016-01-02',
    4500,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7202,
    'TEST_USER2',
    'CLERK',
    7201,
    '2016-02-21',
    1800,
    NULL,
    50
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7203,
    'TEST_USER3',
    'ANALYST',
    7201,
    '2016-04-11',
    3400,
    NULL,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7204,
    'TEST_USER4',
    'SALESMAN',
    7201,
    '2016-05-31',
    2700,
    300,
    60
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7205,
    'TEST_USER5',
    'CLERK',
    7201,
    '2016-07-20',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7206,
    'TEST_USER6',
    'CLERK',
    7201,
    '2016-09-08',
    2600,
    NULL,
    70
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7207,
    'TEST_USER7',
    'LECTURER',
    7201,
    '2016-10-28',
    2300,
    NULL,
    80
);

INSERT INTO exam_emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7208,
    'TEST_USER8',
    'STUDENT',
    7201,
    '2018-03-09',
    1200,
    NULL,
    80
);

SELECT
    *
FROM
    exam_emp;

--[실습3] exam_emp에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다
--많은 급여를 받고 있는 사원들을 70번 부서로 변경
--50번 부서의 평균 급여
SELECT
    AVG(sal)
FROM
    exam_emp
WHERE
    deptno = 50;

UPDATE exam_emp
SET
    deptno = 70
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            exam_emp
        WHERE
            deptno = 50
    );

--[실습4] exam_emp에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 
--늦게 입사한 급여를 10%인상하고 80번 부서로 변경
UPDATE exam_emp
SET
    sal = sal * 1.1,
    deptno = 80
WHERE
    hiredate > (
        SELECT
            MIN(hiredate)
        FROM
            exam_emp
        WHERE
            deptno = 60
    );

--[실습5] exam_emp에 속한 사원 중, 급여 등급이 5인 사원을 삭제
DELETE FROM exam_emp
WHERE
    empno IN (
        SELECT
            empno
        FROM
                 exam_emp e
            JOIN exam_salgrade s ON e.sal BETWEEN s.losal AND s.hisal
        WHERE
            s.grade = 5
    );

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

--외래키 부분 references dept_fk(deptno) : 어느 테이블에 어느필드명을 참조할 것인지
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

INSERT INTO dept_sequence (
    deptno,
    dname,
    loc
) VALUES (
    dept_seq.NEXTVAL,
    'DATEBASE',
    'SEOUL'
);
--여러번 반복해서 시퀀스 입력하면 오류 : sequence DEPT_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated

SELECT
    *
FROM
    dept_sequence
WHERE
    deptno = 20;

SELECT
    *
FROM
    dept_sequence;

--시퀀스 수정
ALTER SEQUENCE dept_seq INCREMENT BY 3 MAXVALUE 99 CYCLE;

--뷰(view) : 가상 테이블
--           하나 이상의 테이블을 조회하는 select 문을 저장한 객체
--           편리성 -- select 문의 복잡도를 완화
--           보완성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

--뷰 생성
CREATE VIEW vm_emp20 AS
    ( SELECT
        empno,
        ename,
        job,
        deptno
    FROM
        emp
    WHERE
        deptno = 20
    );

SELECT
    *
FROM
    vm_emp20;

--insert
INSERT INTO vm_emp20 (
    empno,
    ename,
    job,
    deptno
) VALUES (
    8000,
    'TEST',
    'MANAGER',
    20
);

SELECT
    *
FROM
    vm_emp20;

--view와 원본 테이블 연결 여부
SELECT
    *
FROM
    emp;

--생성된 뷰들의 속성 확인하기
SELECT
    *
FROM
    user_updatable_columns
WHERE
    table_name = 'VM_EMP20';

--뷰 생성시 원본 데이터 수정 불가하도록 작성
CREATE VIEW vm_emp_read AS
    SELECT
        empno,
        ename,
        job
    FROM
        emp
WITH READ ONLY; 
