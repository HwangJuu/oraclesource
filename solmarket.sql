CREATE TABLE myuser (
	user_no NUMBER NOT NULL,
	user_id VARCHAR2(12) NOT NULL,
	user_pw VARCHAR(15) NOT NULL,
	user_name NVARCHAR2(8) NOT NULL,
	user_mail VARCHAR2(38) NOT NULL,
	user_profile NVARCHAR2(50) NOT NULL,
	user_ver NUMBER(2) DEFAULT 0,
	user_pf VARCHAR2(128) NOT NULL,
	user_pfsize NUMBER(8) NOT NULL,
	user_status NUMBER(2) DEFAULT 0,
	user_auth VARCHAR2(8) DEFAULT 'USER'
);


-- 샘플 데이터 입력
insert into myuser values(myuser_seq.nextval, 'abc123','abcd1234','홍길동','abc@naver.com','안녕하세요',1,'a',1024,1,'USER');
insert into myuser values(myuser_seq.nextval, 'abc123','abcd1234','홍길동','abc@naver.com','안녕하세요',1,'a',1024,1,'USER');
insert into myuser values(myuser_seq.nextval, 'abc123','abcd1234','홍길동','abc@naver.com','안녕하세요',1,'a',1024,1,'USER');
insert into myuser values(myuser_seq.nextval, 'abc123','abcd1234','성춘향','abc@naver.com','안녕하세요',1,'a',1024,1,'SELLER');
insert into myuser values(myuser_seq.nextval, 'abc123','abcd1234','석구','abc@naver.com','안녕하세요',1,'a',1024,1,'SELLER');

select * from myuser;
select * from product;

commit;


ALTER TABLE myuser ADD CONSTRAINT PK_USER PRIMARY KEY (user_no);

CREATE TABLE category (
	category_no NUMBER NOT NULL,
	category_name VARCHAR2(32) NOT NULL
);

--카테고리 샘플 데이터 추가
insert into category values(1, '패션잡화');
insert into category values(2, '의류');
insert into category values(3, '푸드');
insert into category values(4, '캔들/디퓨저/방향제');
insert into category values(5, '문구/팬시');
insert into category values(6, '향수/화장품/뷰티');
insert into category values(7, '기타');


ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (category_no);

CREATE TABLE notice (
	notice_no	NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	notice_title VARCHAR2(128) NOT NULL,
	notice_content VARCHAR2(1024) NOT NULL,
	notice_date DATE	DEFAULT sysdate,
	notice_category VARCHAR2(10) NOT NULL
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (notice_no);

CREATE TABLE notice_img (
	notice_no	NUMBER NOT NULL,
	notice_img VARCHAR2(128) NOT NULL,
	notice_imgsize NUMBER(8) NOT NULL
);

ALTER TABLE notice_img ADD CONSTRAINT FK_NOTICE_IMG FOREIGN KEY(notice_no) REFERENCES notice(notice_no);

CREATE TABLE board (
	board_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	board_title VARCHAR2(128) NOT NULL,
	board_content VARCHAR2(1024) NOT NULL,
	board_date DATE DEFAULT sysdate,
	board_hit NUMBER DEFAULT 0,
	board_repl NUMBER DEFAULT 0
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (board_no);

CREATE TABLE board_img (
	board_no NUMBER	 NOT NULL,
	board_img VARCHAR2(128) NOT NULL,
	board_imgsize NUMBER(8) NOT NULL
);

ALTER TABLE board_img ADD CONSTRAINT FK_BOARD_IMG FOREIGN KEY (board_no) REFERENCES board(board_no);

CREATE TABLE reply (
	reply_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	board_no NUMBER	 NOT NULL,
	reply_content VARCHAR2(512) NOT NULL,
	reply_date DATE DEFAULT sysdate
);

ALTER TABLE reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (reply_no);
ALTER TABLE reply ADD CONSTRAINT FK_REPLY_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE reply ADD CONSTRAINT FK_REPLY_BOARD FOREIGN KEY(board_no) REFERENCES board(board_no);

CREATE TABLE market (
	market_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_name NVARCHAR2(20) NOT NULL,
	market_loc VARCHAR2(128) NOT NULL,
	market_sd DATE NOT NULL,
	market_ed DATE NOT NULL,
	market_rate NUMBER(2) DEFAULT 0,
	market_status NUMBER(2) DEFAULT 0
);

ALTER TABLE market ADD CONSTRAINT PK_MARKET PRIMARY KEY (market_no);
ALTER TABLE market ADD CONSTRAINT FK_MARKET_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);

CREATE TABLE market_img (
	market_no NUMBER NOT NULL,
	market_img VARCHAR2(128) NOT NULL,
	market_imgsize NUMBER(8) NOT NULL
);

ALTER TABLE market_img ADD CONSTRAINT FK_MARKET_IMG FOREIGN KEY(market_no) REFERENCES market(market_no);

CREATE TABLE review(
	review_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	review_content VARCHAR2(512) NOT NULL,
	review_date DATE DEFAULT sysdate,
	review_rate NUMBER(2) NOT NULL
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (review_no);
ALTER TABLE review ADD CONSTRAINT FK_REVIEW_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE review ADD CONSTRAINT FK_REVIEW_MARKET FOREIGN KEY(market_no) REFERENCES market(market_no);

CREATE TABLE product (
	product_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	market_no NUMBER NOT NULL,
	category_no NUMBER NOT NULL,
	product_name NVARCHAR2(20) NOT NULL,
	product_qn NUMBER(4) NOT NULL,
	product_price NUMBER(16) NOT NULL,
	product_status NUMBER(2) DEFAULT 0
);

--상품 넣기
insert into product values(product_seq.nextval, 4, 1, 2, '원피스',50,22000,3,'빨강색',sysdate,0);
insert into product values(product_seq.nextval, 5, 2, 3, '샌드위치',100,4500,4,'에그',sysdate,0);
insert into product values(product_seq.nextval, 6, 3, 4, '캔들',150,8000,5,'드라이플라워',sysdate,0);
insert into product values(product_seq.nextval, 7, 4, 5, '볼펜',100,1200,6,'검정',sysdate,0);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_MARKET FOREIGN KEY(market_no) REFERENCES market(market_no);
ALTER TABLE product ADD CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY(category_no) REFERENCES category(category_no);
ALTER TABLE product ADD product_content NVARCHAR2(512) NOT NULL;
ALTER TABLE product ADD product_date DATE DEFAULT SYSDATE;
ALTER TABLE product ADD product_sale NUMBER(4);
--

commit;
--쏠마켓 샘플 데이터
DELETE from product;

SELECT * FROM MARKET;
DESC MARKET;

SELECT * FROM PRODUCT;
DESC PRODUCT;

SELECT * FROM MYUSER;
select * from user_sequences;
-- 마켓 만들기
insert into market values(market_seq.nextval, 4, '쏠','강남','2022-06-10','2022-06-10',1,1);
insert into market values(market_seq.nextval, 4, 'sol','마포','2022-06-10','2022-06-10',1,2);
insert into market values(market_seq.nextval, 5, 'SOL','중구','2022-06-10','2022-06-10',1,3);


delete from product;

drop sequence product_seq;

CREATE TABLE product_img(
	product_no NUMBER NOT NULL,
	product_img VARCHAR2(128) NOT NULL,
	product_imgsize NUMBER(8) NOT NULL
);

ALTER TABLE product_img ADD CONSTRAINT FK_PRODUCT_IMG FOREIGN KEY(product_no) REFERENCES product(product_no);

CREATE TABLE myorder(
	order_no NUMBER NOT NULL,
	product_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	order_qn NUMBER(4) NOT NULL,
	order_pay NUMBER(16) NOT NULL,
	order_send VARCHAR2(128) NOT NULL
);

ALTER TABLE myorder ADD CONSTRAINT PK_ORDER PRIMARY KEY (order_no);
ALTER TABLE myorder ADD CONSTRAINT FK_ORDER_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE myorder ADD CONSTRAINT FK_ORDER_PRODUCT FOREIGN KEY(product_no) REFERENCES product(product_no);

CREATE TABLE delivery(
	delivery_no NUMBER NOT NULL,
	order_no NUMBER NOT NULL,
	delivery_sendno VARCHAR2(16) NOT NULL,
	delivery_status VARCHAR(255) DEFAULT 0
);

ALTER TABLE delivery ADD CONSTRAINT PK_DELIVERY PRIMARY KEY (delivery_no);
ALTER TABLE delivery ADD CONSTRAINT FK_DELIVERY_ORDER FOREIGN KEY(order_no) REFERENCES myorder(order_no);

select rownum from product order by product_no;

CREATE TABLE cart (
	cart_no NUMBER NOT NULL,
	user_no NUMBER NOT NULL,
	product_no NUMBER NOT NULL,
	cart_qn NUMBER(4) NOT NULL,
	cart_pay NUMBER(16) NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT FK_CART_USER FOREIGN KEY(user_no) REFERENCES myuser(user_no);
ALTER TABLE cart ADD CONSTRAINT FK_CART_PRODUCT FOREIGN KEY(product_no) REFERENCES product(product_no);

ALTER TABLE market MODIFY market_rate NUMBER DEFAULT 0.0;

CREATE SEQUENCE myUser_seq;
CREATE SEQUENCE category_seq;
CREATE SEQUENCE notice_seq;
CREATE SEQUENCE notice_img_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE board_img_seq;
CREATE SEQUENCE reply_seq;
CREATE SEQUENCE market_seq;
CREATE SEQUENCE market_img_seq;
CREATE SEQUENCE review_seq;
CREATE SEQUENCE product_seq;
CREATE SEQUENCE product_img_seq;
CREATE SEQUENCE myOrder_seq;
CREATE SEQUENCE delivery_seq;
CREATE SEQUENCE cart_seq;

DROP SEQUENCE notice_img_seq;
DROP SEQUENCE board_img_seq;
DROP SEQUENCE market_img_seq;
DROP SEQUENCE product_img_seq;



commit;



select * from 
			(select rownum as num, statusList.* from
				(select user_name as userName, p.* from 
					(select p.product_no as productNo, m.market_name as dummy,
							p.user_no as userNo,
							p.product_name as productName, p.product_price as productPrice,
							p.product_content as productContent, p.product_date as productDate,
							p.product_status as productStatus
					from product p left outer join market m on p.market_no = m.market_no 
					where p.user_no = 4 order by p.product_no desc) p 
				left outer join myUser u on p.userNo = u.user_no) statusList
				where rownum <= 20)
			where num > 10;

