CREATE TABLE member_tbl_02(
	custno number(6) NOT NULL, 
	custname varchar2(20),
	phone varchar2(13),
	addres varchar2(60),
	joindate DATE,
	grade char(1),
	city char(2),
	meminfo char(20),
	memsalse char(20),
	PRIMARY KEY (custno)
	);

CREATE TABLE money_tbl_02(
	custno number(6) NOT NULL, 
	salenol number(8) NOT NULL, 
	pcost number(8),
	amount number(4),
	price NUMBER(8),
	pcode varchar2(4),
	sdate date,
	meminfo char(20),
	memsalse char(20),
	PRIMARY KEY (custno,salenol)
	);

CREATE SEQUENCE member_seq INCREMENT BY 1
START WITH 100001;

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');

INSERT INTO idev.MEMBER_TBL_02
(CUSTNO, CUSTNAME, PHONE, ADDRES, JOINDATE, GRADE, CITY)
VALUES(member_seq.nextval, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');




INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160001 , 500, 5, 2500, 'A001', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160002 , 1000, 4, 4000, 'A002', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100001, 20160003 , 1500, 3, 1500, 'A008', '20160101');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160004 , 2000, 1, 2000, 'A004', '20160102');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100002, 20160005 , 500, 1, 500, 'A001', '20160103');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100003, 20160006 , 1500, 2, 3000, 'A003', '20160103');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160007 , 500, 2, 1000, 'A001', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160008 , 300, 1, 300, 'A005', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160009 , 600, 1, 600, 'A006', '20160104');

INSERT INTO IDEV.MONEY_TBL_02
(CUSTNO, SALENOL, PCOST, AMOUNT, PRICE, PCODE, SDATE)
VALUES(100004, 20160010 , 3000, 1, 3000, 'A007', '20160106');



SELECT * FROM MEMBER_TBL_02;
SELECT * FROM MONEY_TBL_02;

SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
GROUP BY CUSTNO
ORDER BY asum DESC;

-- step 3) 고객정보 가져오기 위한 joindate 
SELECT * FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO
	ORDER BY asum DESC) sale
	WHERE mt.CUSTNO = sale.custno; 

-- step 4) 요구사항에 따라 필요한 컬럼만 조회하기
SELECT mt.CUSTNO, CUSTNAME, GRADE, ASUM FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO
	ORDER BY asum DESC) sale
	WHERE mt.CUSTNO = sale.custno; 

-- step 5) 제시한 요구사항에 따라 컬럼결과 변경하기
SELECT mt.CUSTNO, CUSTNAME, DECODE(grade ,'A','VIP','B','일반','C','직원') AS agrade,
	ASUM FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO
	ORDER BY asum DESC) sale
	WHERE mt.CUSTNO = sale.custno; 

-- 문제 변형 : "매출이 없는 회원은 조회되지 않는다." 를 "매출이 없는 회원은 0으로 출력한다."
		-- 1) null 값을 -으로 출력하는 함수 : nvl 
		-- 2) 외부조인으로 수정합니다.
		-- 3) 매출합계가 같을 때는 회원번호 순서(오름차순)대로 출력합니다.	(참고:역순은 내림차순)
SELECT mt.CUSTNO, CUSTNAME, DECODE(grade ,'A','VIP','B','일반','C','직원') AS agrade,
	nvl(ASUM,0) AS sum_ FROM MEMBER_TBL_02 mt ,		-- 1)번 해결
	(SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO
	) sale
	WHERE mt.CUSTNO = sale.custno(+)		-- 2)번 해결
	ORDER BY sum_ DESC,custno;				-- 3)번 해결 asum 이 같을 때는 custno 순서로 합니다.
	
	
	-- 위의 5)번 select 실행 결과를 가상테이블 view 로 생성합니다.
	CREATE VIEW v_by_custno
	AS
	SELECT mt.CUSTNO, CUSTNAME, DECODE(grade ,'A','VIP','B','일반','C','직원') AS agrade,
	ASUM FROM MEMBER_TBL_02 mt ,
	(SELECT CUSTNO, sum(price) AS asum FROM MONEY_TBL_02 mt 
	GROUP BY CUSTNO
	ORDER BY asum DESC) sale
	WHERE mt.CUSTNO = sale.custno; 
	

SELECT * FROM V_BY_CUSTNO vbc ;
SELECT * FROM V_BY_CUSTNO WHERE CUSTNO = 100001;
	
	
	
	