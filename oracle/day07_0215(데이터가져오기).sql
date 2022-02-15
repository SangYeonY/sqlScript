-- 전국야영자 정보조회와 예약을 가정하고 검색에 필요한 내용들 연습



-- 전체 데이터 갯수는?
SELECT count(*) FROM TBL_CAMPAREA tc ;


-- 강원도 데이터 갯수는?
SELECT COUNT(*) FROM TBL_CAMPAREA tc  WHERE ADDRESS LIKE '강원도%';
 
SELECT DISTINCT substr(ADDRESS,1,instr(ADDRESS,' '))	-- substr(문자열,시작위치,길이)
FROM TBL_CAMPAREA tc ;	-- 주소에서 첫번째 공백 앞부분 추출(중복없이)


-- 강원도의 자동차야영장 이름, 부대시설 조회하기
SELECT CAMP_NAME ,ETC1,ETC2 FROM TBL_CAMPAREA tc  
WHERE ADDRESS LIKE '강원도%' AND CAMP_TYPE LIKE '%자동차%';



-- 자동차 야영장 갯수가 50개 이상인 곳 야영장이름, 주소 조회하기
SELECT CAMP_NAME, ADDRESS FROM TBL_CAMPAREA tc  
WHERE CAR_CNT > 50 ;


-- 카라반 있는 야영장 이름,주소,카라반 갯수 조회하기
SELECT CAMP_NAME ,ADDRESS ,CARA_CNT FROM TBL_CAMPAREA tc  
WHERE CARA_CNT > 0 
ORDER BY ADDRESS ;	-- 주소 정렬






