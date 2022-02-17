-- 동등 조인 형식 1
SELECT * FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
			WHERE tp.PCODE = tb.PCODE ;		

-- 동등 조인 형식2(표준)
		SELECT * FROM "TBL_PRODUCT#" tp 
				JOIN "TBL_BUY#" tb 
				ON tp.PCODE = tb.PCODE ;
				

-- 복습 : 아이패드('IPAD011')를 구매한 사용자 이름과 구매날짜 조회
-- 조인할 테이블? -> 공통 컬럼?
			
	SELECT tc.NAME ,tb.BUY_DATE FROM "TBL_CUSTOM#" tc , "TBL_BUY#" tb 
				WHERE tc.CUSTOM_ID = tb.CUSTOM_ID AND pcode ='IPAD011';
				
	SELECT tc.NAME , tb.BUY_DATE FROM "TBL_CUSTOM#" tc 
				JOIN "TBL_BUY#" tb 
				ON tc.CUSTOM_ID = tb.CUSTOM_ID 
				WHERE pcode = 'IPAD011';
				
			
-- day5 : alter table 형식
-- 테스트용 테이블 : 컬럼명,값 들은 의미 없습니다. 형식과 제약조건만 주의하세요.			
CREATE TABLE tbl# (
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol number(3)
);

INSERT INTO "TBL#" (ccol) VALUES(12);	-- 오류 : NOT NULL 컬럼(제약조건) 값이 저장안됨.
INSERT INTO "TBL#" (bcol,ccol) values('xytz',12);	-- 오류 : NOT NULL 컬럼(제약조건) 값이 저장안됨.
INSERT INTO "TBL#" (acol,ccol) values('main',12);	-- 정상실행

-- 컬럼 추가
ALTER TABLE TBL# ADD (dcol timestamp DEFAULT sysdate);
SELECT * FROM TBL#;

-- 컬럼 변경
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO "TBL#" (acol,ccol) values('main22',12);
INSERT INTO "TBL#" (acol) values('main22');		-- ccol 이 '0'
-- 컬럼 제거(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

-- 제약조건 추가(제약조건 이름 지정 필요)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY (acol);
-- 위의 insert 명령때문에 제약조건 위배 -> 중복행 삭제 후 기본키 추가
DELETE FROM tbl# WHERE acol ='main22' AND ccol = 0;

-- 기존 제약조건은 변경 명령 없습니다.	-> 기존 제약조건 삭제후 다시 생성해야 합니다.
ALTER TABLE tbl# DROP CONSTRAINT pk_tbl#;

-- tbl# 테이블에 age 컬럼을 생성합니다. check 제약조건 : 16 이상 90 이하의 값.
ALTER TABLE tbl# ADD age number(3) CHECK (age BETWEEN 16 AND 90);	-- age >= 16 AND age <= 90
INSERT INTO tbl# (acol,age) VALUES ('app',23);	-- 실행
INSERT INTO tbl# (acol,age) VALUES ('app',99);	-- 오류

-- tbl# 테이블에 gender(성별) 컬럼을 생성합니다. check 제약조건 : 'M','F'
ALTER TABLE tbl# ADD gender char(1) check(gender IN ('M','F'));
INSERT INTO tbl# (acol,gender) VALUES ('momo','F');
INSERT INTO tbl# (acol,gender) VALUES ('momo','X');	-- 제약 조건 위반 오류

-- select 에 사용하는 오라클 함수
-- 조회결과를 조작하는 함수	: 예시 age 컬럼 값이 null 일때 0 , gender 'M' 이면 남성 'F'이면 여성 
SELECT * FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode(gender,'M','남성','F','여성') gender2 FROM tbl#;
-- nvl 는 null value 약자, 테이블명/컬럼명 별칭은 AS 키워드를 쓰고 생략할 수 있습니다.

--drop table 
DROP TABLE tbl2#;




