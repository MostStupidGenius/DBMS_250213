-- part2_case_when.sql
/* CASE문
 * CASE문은 특정 열이나 표현식(계산식)의 결과값을 조건에 따라
 * 다른 값으로 치환하는 문법이다. -> 단순 CASE
 * 혹은, 각각의 WHEN절에 서로 다른 조건식을 주어
 * 위에서부터 차례로 검사하여 조건식을 처음으로 만족하는 경우의 THEN 값을
 * 해당 컬럼의 값으로 치환하는 문법이다. -> 검색 CASE
 */
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
, 	CASE 
		WHEN SALARY < 5000 THEN 'LOW'
--		WHEN SALARY BETWEEN 5000 AND 10000 THEN 'MID'
		WHEN SALARY < 10000 THEN 'MID'
		ELSE 'HIGH'
	END AS "LEVEL"
FROM EMPLOYEES;

-- 단순 CASE문
SELECT 
CASE EMPLOYEE_ID
	WHEN 100 THEN 'CEO'
	WHEN 101 THEN '2ND'
	WHEN 102 THEN '3RD'
	ELSE '직원'
END AS 타입
FROM EMPLOYEES;

-- CASE 실습
/* 1. PLAYER 테이블에서
 * WEIGHT_TYPE이라는 컬럼으로 
 * WEIGHT가 80이상일 경우 '비만'
 * 70이상일 경우 '과체중'
 * 60이상일 경우 '정상'
 * 60미만일 경우 '저체중'
 * 그외의 경우 '알수없음'
 * 이 표기되도록 CASE-WHEN-THEN문을 사용해보자.
 * */
SELECT 
PLAYER_NAME
, WEIGHT
, HEIGHT
, CASE
	WHEN WEIGHT >= 80 THEN '비만'
	WHEN WEIGHT >= 70 THEN '과체중'
	WHEN WEIGHT >= 60 THEN '정상'
	WHEN WEIGHT < 60 THEN '저체중'
	ELSE '알수없음'
END AS WEIGHT_TYPE
FROM PLAYER
ORDER BY WEIGHT
;

-- 실습1 확장
-- 각 WEIGHT_TYPE별 인원수를 구해보자.
WITH WEIGHT_TYPE_TABLE AS (
	SELECT 
		PLAYER_NAME
		, WEIGHT
		, HEIGHT
		, CASE
			WHEN WEIGHT >= 80 THEN '비만'
			WHEN WEIGHT >= 70 THEN '과체중'
			WHEN WEIGHT >= 60 THEN '정상'
			WHEN WEIGHT < 60 THEN '저체중'
			ELSE '알수없음'
		END AS WEIGHT_TYPE
	FROM PLAYER
	ORDER BY WEIGHT
)
SELECT WEIGHT_TYPE, COUNT(WEIGHT_TYPE) COUNTS
FROM WEIGHT_TYPE_TABLE
GROUP BY WEIGHT_TYPE
;

/*2. PLAYER테이블에서
 * WEIGHT가 80이상이거나 HEIGHT가 180이상일 경우 '떡대'
 * WEIGHT가 70보다 크고 HEIGHT가 170이상일 경우 '평균이상'
 * 그외의 경우 '기타'로
 * BODY_TYPE 컬럼으로 조회
 * HEIGHT와 WEIGHT가 NULL인 경우 제외
 * WEIGHT로 먼저 오름차순 정렬하고, HEIGHT로 오름차순 정렬
 * */
SELECT PLAYER_NAME, WEIGHT, HEIGHT
,
CASE
	WHEN WEIGHT >= 80 OR HEIGHT >= 180 THEN '떡대'
	WHEN WEIGHT > 70 AND HEIGHT >= 170 THEN '평균이상'
	ELSE '기타'
END AS BODY_TYPE
FROM PLAYER
WHERE WEIGHT IS NOT NULL OR HEIGHT IS NOT NULL
ORDER BY WEIGHT, HEIGHT;

-- 단순 CASE 실습
/* PLAYER 테이블에서 POSITION이 
 * 'GK'이면 '골키퍼'
 * 'DF'이면 '수비수'
 * 'FW'이면 '공격수'
 * 'MF'이면 '미드필더'
 * 로 표시하는 컬럼 KOR_POS 출력
 * */
SELECT PLAYER_NAME, "POSITION"
, CASE "POSITION"
	WHEN 'GK' THEN '골키퍼'
	WHEN 'DF' THEN '수비수'
	WHEN 'FW' THEN '공격수'
	WHEN 'MF' THEN '미드필더'
	ELSE '없음' -- NULL값을 다른 값으로
END AS KOR_POS
FROM PLAYER;