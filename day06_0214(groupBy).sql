-- 집계 함수(통계함수,그룹함수) : count,max,min,sum,avg 외에 분산,표준편차, 중앙값 등의 함수도 있음.

-- group by : 특정 컬럼으로 그룹화하고 그에 대해서 집계함수를 적용합니다. 
-- 예시 ) 부서별 연봉평균, 지역별 직원수, 부서별 직원수....

-- 그룹함수 복습
SELECT COUNT(*), AVG(salary) 
FROM EMPLOYEES e  
WHERE JOB_ID  = 'IT_PROG';
-- 오류
SELECT JOB_ID, COUNT(*), AVG(salary) 
FROM EMPLOYEES e
WHERE JOB_ID = 'IT_PROG';

-- group by를 적용하여 업무별로 count, avg 구합니다.
SELECT JOB_ID, COUNT(*), AVG(salary) 
FROM EMPLOYEES e  
group BY JOB_ID ;

-- 부서별 count , avg (그룹함수 결과와 함께 조회할 수 있는 컬럼은 그룹화 컬럼만 가능합니다.)
SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(salary) AS "평균" 
FROM EMPLOYEES e 
group by DEPARTMENT_ID ;

-- departments 테이블과 위의 부서별 집계를 join -> 부서명 조회
SELECT * FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(salary) AS "평균" 
	FROM EMPLOYEES e 
	group by DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;


SELECT * FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(salary) AS "평균" 
	FROM EMPLOYEES e 
	group by DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- 원하는 컬럼만 조회
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수",d2."평균"
FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(salary) AS "평균" 
	FROM EMPLOYEES e 
	group by DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- 조회결과 출력되는 행의 순서를 인원수 내림차순
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수",d2."평균"
FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", AVG(salary) AS "평균" 
	FROM EMPLOYEES e 
	group by DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID 
ORDER BY d2."인원수" desc;		-- 내림차순 DESC

-- 평균급여 오름차순
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d2."인원수",d2."평균"
FROM DEPARTMENTS d ,
	(SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", round(AVG(salary),0) AS "평균" 
	FROM EMPLOYEES e 
	group by DEPARTMENT_ID) d2
WHERE d.DEPARTMENT_ID = d2.DEPARTMENT_ID
ORDER BY d2."평균";

-- 자릿수 지정 함수 : 내림 TRUNCATE , 올림 ceil , 반올림 round -> 소수점이하 자릿수 지정

-- 위의 group by 결과에서 평균금액이 8000 이상인 부서만 조회하기
SELECT DEPARTMENT_ID, COUNT(*) AS "인원수", round(AVG(salary),0) AS "평균" 
FROM EMPLOYEES e 
--	WHERE e."평균" > 8000		-- 오류 : 집계함수 결과값으로 WHERE 사용 X
	group by DEPARTMENT_ID 
	HAVING avg(SALARY) > 8000		-- HAVING : 집계함수 결과값으로 조건식을 직접 사용가능합니다. 일반컬럼도 가능
ORDER BY "평균";

-- 순서 : from -> where -> GROUP BY -> HAVING -> ORDER BY 

-- ALL 키워드 : job_id 가 ST_CLERT 인 모든 직원들의 급여보다 많이 받는 직원들 조회
--		기존 방법은 max 값보다 큰것을 찾는 것. -> ALL 키워드로 바꿔보면

-- EMPLOYEES 테이블 원래 순서를 놓고 max 값보다 큰것만 결과로 추출합니다.
SELECT last_name, salary , job_id FROM EMPLOYEES e 
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 WHERE JOB_ID = 'ST_CLERK');
-- 행을 salary 컬럼으로 정렬하고 조건에 맞는 것만 추출합니다.
SELECT last_name, salary , job_id FROM EMPLOYEES e 
WHERE SALARY > ALL(SELECT SALARY FROM EMPLOYEES e2 WHERE JOB_ID = 'ST_CLERK');




