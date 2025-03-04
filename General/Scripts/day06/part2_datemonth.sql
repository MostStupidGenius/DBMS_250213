-- part2_datemonth.sql
-- 날짜와 시간 함수
-- 데이터베이스 서버의 시스템 시간을 반환하는 객체
SELECT SYSDATE
FROM DUAL;

-- CURRENT_DATE
-- 시스템의 날짜가 아니라 로컬 타임을 반환하는 함수
SELECT CURRENT_DATE
FROM DUAL;

-- ADD_MONTHS
-- 주어진 날짜에 특정 개월 수를 더하는 함수
SELECT ADD_MONTHS(SYSDATE, 21)
FROM DUAL;

-- MONTHS_BETWEEN
-- 두 날짜 사이의 정확한 개월 수를 계산하는 함수
SELECT FLOOR(
	MONTHS_BETWEEN(
		TO_DATE('2099-01-01'), SYSDATE
	)
) AS "2099"
FROM DUAL;

-- 실습
-- MONTHS_BETWEEN 함수를 사용하여 
-- EMPLOYEES의 각 직원의 근속 개월 수를 계산하는
-- 쿼리를 작성하라
-- 이때 근속의 기준은 SYSDATE를 기준으로 한다.
SELECT FIRST_NAME
, FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 근속개월수
FROM EMPLOYEES;

SELECT PLAYER_ID, PLAYER_NAME, FLOOR(TO_NUMBER(PLAYER_ID) / 1000) AS YYYY
, JOIN_YYYY
FROM PLAYER;