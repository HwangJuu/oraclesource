--SQL 실행순서
--select 컬럼명            ⑤
--from 테이블명            ① 
--where 조건절             ②
--group by 컬럼명          ③   
--having 집계함수 조건절   ④
--order by 컬럼명          ⑥

--where 절 조건
-- 일치 =, 불일치 !=, <>
-- 대소 >,>=,<,<=
-- 범위 betwenn A and B
-- 범위 not between A and B
-- like '% ~~%'
-- not like '% ~~ %'
-- is null
-- is not null

-- 1. 데이터 탐색
-- 1) 모든 컬럼 추출하기
-- gmv_trend : 2017년 ~ 2021년 3월까지 전자 상거래 추정 거래액 (단위 : 백만원)

SELECT
    *
FROM
    gmv_trend;

SELECT
    category,
    gmv
FROM
    gmv_trend;

-- category 중복값 없이
SELECT DISTINCT
    category
FROM
    gmv_trend;

-- yyyy 중복값 없이
SELECT DISTINCT
    yyyy
FROM
    gmv_trend;

------------------------------------------------
-- 특정 연도의 매출액 탐색 : 연도 컬럼이 숫자 => 대소비교, between
------------------------------------------------
--2017년 연도의 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    yyyy = 2017;

--2019년 이후 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    yyyy >= 2019;

--2019 ~ 2021년 사이의 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    yyyy BETWEEN 2019 AND 2021;

-- 2021년을 제외한 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    yyyy != 2021; -- <> 사용 가능

------------------------------------------------
-- 특정 카테고리의 매출액 탐색 : 문자열 => like, =, !=, in, not in
------------------------------------------------

-- category가 '여행 및 교통 서비스' 인 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category = '여행 및 교통서비스';

-- category가 '여행 및 교통 서비스' 아닌 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category != '여행 및 교통서비스';

-- category가 '여행 및 교통 서비스'이거나 '컴퓨터 및 주변기기'인 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category = '여행 및 교통서비스'
    OR category = '컴퓨터 및 주변기기';

SELECT
    *
FROM
    gmv_trend
WHERE
    category IN ( '여행 및 교통서비스', '컴퓨터 및 주변기기' );

-- category가 '여행 및 교통서비스'이거나 '컴퓨터 및 주변기기' 아닌 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category NOT IN ( '여행 및 교통서비스', '컴퓨터 및 주변기기' );

--category가 '패션'이 들어간 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category LIKE '%패션%';

--category가 '패션'이 안들어간 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    category NOT LIKE '%패션%';

-- 2017년도의 여행 및 교통서비스 카테고리 추출
SELECT
    *
FROM
    gmv_trend
WHERE
        yyyy = 2017
    AND category = '여행 및 교통서비스';

-- 2017년도의 컴퓨터 및 주변기기 카테고리 추출
SELECT
    *
FROM
    gmv_trend
WHERE
        yyyy = 2017
    AND category = '컴퓨터 및 주변기기';

-- 연도가 2018 이거나 category 명이 '컴퓨터 및 주변기기' 매출
SELECT
    *
FROM
    gmv_trend
WHERE
    yyyy = 2018
    OR category = '컴퓨터 및 주변기기';

-- 연도가 2018년이고, gmv가 100000 보다 작고, gmv가 10000 보다 큰 매출 
SELECT
    *
FROM
    gmv_trend
WHERE
        yyyy = 2018
    AND ( gmv < 100000
          OR gmv > 10000 );

-- 카테고리별 매출액
SELECT
    category,
    SUM(gmv)
FROM
    gmv_trend
GROUP BY
    category; 

-- 카테고리, 연도별 매출액 
SELECT
    category,
    SUM(gmv)
FROM
    gmv_trend
GROUP BY
    category,
    yyyy
ORDER BY
    category; 

-- 전체 매출액
SELECT
    SUM(gmv) AS gmv
FROM
    gmv_trend;
    
-- 매출액이 높은 주요 카테고리 확인


-- 특정 매출액(카테고리 - 50,000,000) 이상 카테고리 추출
SELECT
    category,
    SUM(gmv)
FROM
    gmv_trend
GROUP BY
    category
HAVING
    SUM(gmv) >= 50000000;
    
--  특정 매출액(카테고리 - 10,000,000) 이상 카테고리 추출  
-- 년도가 2020
-- where : 집계 전 데이터 필터링, having : 집계 후 필터링(집계 함수만 옴)
SELECT
    category,
    SUM(gmv)
FROM
    gmv_trend
WHERE
    yyyy = 2020
GROUP BY
    category
HAVING
    SUM(gmv) >= 10000000;

-- 매출액(카테고리)이 높은 순으로 카테고리 정렬
SELECT
    category,
    SUM(gmv) AS gmv
FROM
    gmv_trend
GROUP BY
    category
ORDER BY
    gmv DESC;

-- 매출액(년도별, 월별)이 높은 순으로 년도별, 월별 정렬
SELECT
    yyyy,
    mm,
    SUM(gmv) AS gmv
FROM
    gmv_trend
GROUP BY
    yyyy,
    mm
ORDER BY
    yyyy,
    mm;

------------------------------------
-- orderTBL
------------------------------------
SELECT
    *
FROM
    ordertbl;

-- userid가 없는 주문 내역 조회
SELECT
    *
FROM
    ordertbl
WHERE
    userid IS NULL;

-- 아이템 테이블 조회
SELECT
    *
FROM
    item;

SELECT
    *
FROM
    category;

-- orderTBL orderid 컬럼은 item id(num)와 일치
-- orderTBL userid 컬럼은 usertbl 의 userid와 일치
-- item category_id 컬럼은 category id(num) 와 일치

-- 상품별 매출액 집계 후 매출액 높은 순으로 정렬
-- ordertbl

SELECT
    itemid,
    SUM(gmv) AS gmv
FROM
    ordertbl
GROUP BY
    itemid
ORDER BY
    gmv DESC;
    
-- 위의 결과 + itemid 의 제품이 무엇인지 보여주기(item)
SELECT
    itemid,
    item_name,
    SUM(gmv) AS gmv
FROM
    ordertbl o,
    item     i
WHERE
    o.itemid = i.num -- num(id)
GROUP BY
    itemid,
    item_name
ORDER BY
    gmv DESC;
    
-- join ~on
SELECT
    itemid,
    item_name,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN item i ON o.itemid = i.num -- num(id)
GROUP BY
    itemid,
    item_name
ORDER BY
    gmv DESC;
    
-- 카테고리별 매출액 : 3개 조인
SELECT
    c.cate1,
    c.cate2,
    c.cate3,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN item     i ON o.itemid = i.num
    JOIN category c ON i.category_id = c.num
GROUP BY
    c.cate1,
    c.cate2,
    c.cate3
ORDER BY
    gmv DESC;
    
-- 성별 매출액
SELECT
    u.gender,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
GROUP BY
    u.gender
ORDER BY
    gmv DESC;
    
-- 성별/ 연령대 별 매출액
SELECT
    *
FROM
    usertbl; -- 연령대 그룹 확인

SELECT
    u.gender,
    u.age_band,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
GROUP BY
    u.gender,
    u.age_band
ORDER BY
    u.gender,
    u.age_band;
    
-- 남성이 구매하는 아이템 조회
-- 남성인지 알수 있는 테이블 USERTBL - GENDER
-- ORDERTBL - USERID 조인

-- 남성은 몇명?
SELECT
    COUNT(*)
FROM
    usertbl
WHERE
    gender = 'M';

-- 남성이 구매한 아이템 조회? (usertbl, ordertbl 테이블 조인)
SELECT
    u.userid,
    o.itemid
FROM
         usertbl u
    JOIN ordertbl o ON u.userid = o.userid
WHERE
    u.gender = 'M';

--7,20 아이템명과 매출액 조회
SELECT
    i.item_name,
    SUM(gmv) AS gmv
FROM
         usertbl u
    JOIN ordertbl o ON u.userid = o.userid
    JOIN item     i ON o.itemid = i.num
WHERE
    u.gender = 'M'
GROUP BY
    i.item_name;
    
-- 내부조인과 외부조인
SELECT
    *
FROM
    ordertbl
WHERE
    userid IS NULL; --24명
SELECT
    *
FROM
    usertbl
WHERE
    userid IS NULL; -- 0명
    
-- ordertbl과 usertbl 조인할 때
-- gender, age_band, sum(gmv)
-- group by gender, age_band
-- 24명에 대한 정보는 빠지고 조회됨.
-- 내부조인
SELECT
    u.gender,
    u.age_band,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
GROUP BY
    u.gender,
    u.age_band
ORDER BY
    u.gender,
    u.age_band;

-- 외부 조인
-- 9행이 출력 : 비회원 구매 매출액
SELECT
    u.gender,
    u.age_band,
    SUM(gmv) AS gmv
FROM
    ordertbl o
    LEFT OUTER JOIN usertbl  u ON o.userid = u.userid
GROUP BY
    u.gender,
    u.age_band
ORDER BY
    u.gender,
    u.age_band;
    
-- ordertbl 날짜 컬럼 조회
SELECT
    dt
FROM
    ordertbl;

--number ==> 문자열로 변경
SELECT
    dt,
    to_char(dt) AS yyyymmdd
FROM
    ordertbl;

-- 년, 월, 일 구별 : 문자로 변경했기 때문에 잘라내기 가능
SELECT
    dt,
    substr(to_char(dt), 1, 4) AS yyyy,
    substr(to_char(dt), 5, 2) AS mm,
    substr(to_char(dt), 7, 2) AS dd
FROM
    ordertbl;
    
    
-- 한꺼번에 연결
SELECT
    dt,
    substr(to_char(dt), 1, 4)
    || '-'
    || substr(to_char(dt), 5, 2)
    || '-'
    || substr(to_char(dt), 7, 2) AS yyyymmdd
FROM
    ordertbl;
    
--ordertbl userid가 null 인 경우 다른 값으로 변경
-- nvl()
SELECT
    userid,
    nvl(userid, '0')
FROM
    ordertbl
WHERE
    userid IS NULL;

-- NA 
--number 타입인데 문자열로 바꿀 수 없음
SELECT
    userid,
    nvl(userid, 'NA') -- 01722. 00000 -  "invalid number"
FROM
    ordertbl
WHERE
    userid IS NULL;
-- 수정 후
SELECT
    userid,
    nvl(to_char(userid), 'NA')
FROM
    ordertbl
WHERE
    userid IS NULL;
    
-- 결과 값이 null 인경우 'NA'로 출력
SELECT
    nvl(u.gender, 'NA')   AS gender,
    nvl(u.age_band, 'NA') AS age_band,
    SUM(gmv)              AS gmv
FROM
    ordertbl o
    LEFT OUTER JOIN usertbl  u ON o.userid = u.userid
GROUP BY
    u.gender,
    u.age_band
ORDER BY
    u.gender,
    u.age_band;
    
-- case ~ when ~ else
-- F : 여성, M: 남성으로 출력되게 하고 싶음
SELECT
    gender
FROM
    usertbl;

SELECT
    gender,
    CASE gender
        WHEN 'M' THEN
            '남성'
        WHEN 'F' THEN
            '여성'
        ELSE
            'NA'
    END AS 성별
FROM
    usertbl;
    
--20~24 : 20s, 25~29 : 20s, 30~34,35~39 : 30s, 40~44: 40s, else : NA
SELECT
    nvl(u.gender, 'NA') AS gender,
    CASE u.age_band
        WHEN '20~24' THEN
            '20s'
        WHEN '25~29' THEN
            '20s'
        WHEN '30~34' THEN
            '30s'
        WHEN '35~39' THEN
            '30s'
        WHEN '40~44' THEN
            '40s'
        ELSE
            'NA'
    END                 AS age_gorup,
    SUM(gmv)            AS gmv
FROM
    ordertbl o
    LEFT OUTER JOIN usertbl  u ON o.userid = u.userid
GROUP BY
    u.gender,
    u.age_band
ORDER BY
    u.gender,
    u.age_band;
    
-- TOP3 카테고리와 그 외 상품의 매출액 비교
SELECT
    item_type,
    SUM(gmv) AS gmv
FROM
    (
        SELECT
            CASE
                WHEN c.cate1 IN ( '스커트', '티셔츠', '원피스' ) THEN
                    'TOP3'
                ELSE
                    '기타'
            END      AS item_type,
            SUM(gmv) AS gmv
        FROM
                 ordertbl o
            JOIN item     i ON o.itemid = i.num
            JOIN category c ON i.category_id = c.num
        GROUP BY
            c.cate1,
            c.cate2,
            c.cate3
        ORDER BY
            gmv DESC
    )
GROUP BY
    item_type;
    

-- 아이템 컨셉을 지정 후 추출
-- 시크, 깜찍, 청순, 기본 키워드별 상품 분류 후 매출 구하기
--ordertbl : item_name, item_concept, gmv
-- item_concept : item_name에 청순 키워드가 존재하는 경우 청순컨셉, 
-- 깜찍 --> 깜찍컨셉, 시크 --> 시크컨셉, 기본 --> 기본컨셉, 아무것도 없다면 --> 미분류

SELECT
    item_name,
    CASE
        WHEN item_name LIKE '%깜찍%' THEN
            '깜찍컨셉'
        WHEN item_name LIKE '%청순%' THEN
            '청순컨셉'
        WHEN item_name LIKE '%시크%' THEN
            '시크컨셉'
        WHEN item_name LIKE '%기본%' THEN
            '기본컨셉'
        ELSE
            '미분류'
    END      AS item_concept,
    SUM(gmv) AS gmv
FROM
         ordertbl o
    JOIN item i ON o.itemid = i.num
GROUP BY
    item_name
ORDER BY
    gmv DESC;
    
-- item_concept 별 매출 구하기
SELECT
    item_concept,
    SUM(gmv) AS gmv
FROM
    (
        SELECT
            item_name,
            CASE
                WHEN item_name LIKE '%깜찍%' THEN
                    '깜찍컨셉'
                WHEN item_name LIKE '%청순%' THEN
                    '청순컨셉'
                WHEN item_name LIKE '%시크%' THEN
                    '시크컨셉'
                WHEN item_name LIKE '%기본%' THEN
                    '기본컨셉'
                ELSE
                    '미분류'
            END      AS item_concept,
            SUM(gmv) AS gmv
        FROM
                 ordertbl o
            JOIN item i ON o.itemid = i.num
        GROUP BY
            item_name
        ORDER BY
            gmv DESC
    )
GROUP BY
    item_concept
ORDER BY
    gmv DESC;
    
-- 날짜 관련 함수
SELECT
    sysdate,
    current_date,
    current_timestamp
FROM
    dual;
    
--문자열로 바꾸면 형식을 줄 수 있음
SELECT
    to_char(sysdate, 'yyyy-mm-dd')
FROM
    dual;

--연도만 추출
SELECT
    to_char(sysdate, 'yyyy')
FROM
    dual;

--월만 추출
SELECT
    to_char(sysdate, 'mm')
FROM
    dual;

--일만 추출
SELECT
    to_char(sysdate, 'dd')
FROM
    dual;

--현재 날짜에서 2개월 후 날짜 구하기
SELECT
    add_months(sysdate, 2)
FROM
    dual;
-- 현재 날짜에서 2개월 전 날짜 구하기
SELECT
    add_months(sysdate, - 2)
FROM
    dual;
    
-- 현재 날짜에서 +20일
SELECT
    sysdate + 20
FROM
    dual;
    
-- 최근 1년 동안의 매출액
-- gmv_trend 날짜 형식 확인
SELECT
    *
FROM
    gmv_trend; -- 날짜의 형식이 다름
    
SELECT
    add_months(sysdate, -12)
FROM
    dual;

SELECT
    yyyy,
    mm,
    to_date(concat(yyyy, mm), 'yyyymm')
FROM
    gmv_trend;
--최근 1년동안의 매출액
SELECT
    *
FROM
    gmv_trend
WHERE
    to_date(concat(yyyy, mm), 'yyyymm') >= add_months(sysdate, -12);
    
-- 할인율, 이익률, 판매가 계산 : ordertbl
SELECT
    dt,
    orderid,
    userid,
    itemid,
    price,
    unitsold,-- 제품을 몇개씩 판매했는지
    gmv,
    product_profit,
    discount,
    discount / gmv       AS discount_rate,
    gmv - discount       AS paid_amount,
    product_profit / gmv AS product_margin,
    total_profit / gmv   AS total_margin
FROM
    ordertbl;


-- 인당 평균 구매 수량 = 총 판매수량 / 총 고객 수
-- ordertbl과 item join
SELECT
    i.item_name,
    SUM(unitsold)                                    AS unitsold,
    COUNT(DISTINCT userid)                           AS user_cnt,
    round(SUM(unitsold) / COUNT(DISTINCT userid), 2) AS avg_unitsold_per_customer
FROM
         ordertbl o
    JOIN item i ON o.itemid = i.num
GROUP BY
    i.item_name
ORDER BY
    avg_unitsold_per_customer DESC;
    
-- 인당 평균 구매 금액 = 총 구매 금액 / 총 고객 수
SELECT
    i.item_name,
    SUM(unitsold)                                    AS unitsold,
    COUNT(DISTINCT userid)                           AS user_cnt,
    round(SUM(unitsold) / COUNT(DISTINCT userid), 2) AS avg_unitsold_per_customer,
    round(SUM(gmv) / COUNT(DISTINCT userid), 2)      AS avg_gmv_per_customer
FROM
         ordertbl o
    JOIN item i ON o.itemid = i.num
GROUP BY
    i.item_name
ORDER BY
    avg_unitsold_per_customer DESC;
    
-- 인당 구매 금액이 높은 성별 / 연령대 조회
SELECT
    gender,
    age_band,
    SUM(gmv)                                      AS gmv,
    COUNT(DISTINCT o.userid)                      AS user_cnt,
    round(SUM(gmv) / COUNT(DISTINCT o.userid), 2) AS avg_gmv_per_customer
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
GROUP BY
    gender,
    age_band
ORDER BY
    avg_gmv_per_customer DESC;
    
-- 하루 동안 2개 이상의 상품(동일한 제품 제외)을 구매한 고객은 주로 어떤 상품을 구매했을까?
-- 2개씩 구매한 아이디와 건수 조회
SELECT
    userid,
    COUNT(DISTINCT itemid) AS item_cnt
FROM
    ordertbl
GROUP BY
    userid
HAVING
    COUNT(DISTINCT itemid) > 1;
    
-- 위 정보 + usertbl ==> 존재하는 사용자만 추출
SELECT
    o.userid,
    COUNT(DISTINCT itemid) AS item_cnt
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
GROUP BY
    o.userid
HAVING
    COUNT(DISTINCT itemid) > 1;

--최종
SELECT
    cate3,
    i.item_name,
    price,
    COUNT(DISTINCT o.userid) AS user_cnt,
    SUM(gmv)                 AS gmv
FROM
         ordertbl o
    JOIN item     i ON o.itemid = i.num
    JOIN category c ON i.category_id = c.num
    JOIN (
        SELECT
            o.userid,
            COUNT(DISTINCT itemid) AS item_cnt
        FROM
                 ordertbl o
            JOIN usertbl u ON o.userid = u.userid
        GROUP BY
            o.userid
        HAVING
            COUNT(DISTINCT itemid) > 1
    )        user_list ON o.userid = user_list.userid
GROUP BY
    cate3,
    i.item_name,
    price
ORDER BY
    user_cnt DESC;
    
-- 하루동안 2개 이상의 제품을 구매한 고객의 성연령 비율 조회
SELECT
    gender,
    age_band,
    COUNT(DISTINCT o.userid)               AS user_cnt,
    COUNT(DISTINCT
        CASE
            WHEN user_list.userid IS NOT NULL THEN
                user_list.userid
            ELSE
                NULL
        END
    )                                      AS user_id_cnt,
    round(COUNT(DISTINCT
        CASE
            WHEN user_list.userid IS NOT NULL THEN
                user_list.userid
            ELSE
                NULL
        END
    ) / COUNT(DISTINCT o.userid) * 100, 1) AS user_percent
FROM
         ordertbl o
    JOIN usertbl u ON o.userid = u.userid
    LEFT JOIN (
        SELECT
            o.userid,
            COUNT(DISTINCT itemid) AS item_cnt
        FROM
                 ordertbl o
            JOIN usertbl u ON o.userid = u.userid
        GROUP BY
            o.userid
        HAVING
            COUNT(DISTINCT itemid) > 1
    )       user_list ON o.userid = user_list.userid
GROUP BY
    gender,
    age_band
ORDER BY
    gender,
    age_band;