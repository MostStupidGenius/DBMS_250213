-- 서브쿼리(SUBQUERY)
-- FROM절, WHERE절 등에서 사용하는 쿼리문으로
-- 소괄호()로 감싸서 새로운 SELECT문을 그 안에 작성한다.
-- 서브쿼리는 그렇게 조회한 데이터 테이블을 가상의 테이블로
-- 취급하여 일반 테이블처럼 조작을 가할 수 있다.

SELECT P.PLAYER_NAME, P.HEIGHT
FROM (
	SELECT PLAYER_NAME, HEIGHT, WEIGHT
	FROM PLAYER
) P;

SELECT *
FROM PLAYER;

-- GROUP BY
-- 집계함수를 사용하기 위한 절
-- 집계함수는 GROUP BY 없이 사용할 경우
-- 전체 행을 대상으로 삼으며, GROUP BY로 묶을 경우,
-- 해당 그룹바이 대상 열의 각 값별로 집계함수가 적용된다.
-- 즉, 열의 값의 종류 만큼의 행 개수가 출력된다.
-- 평균: AVG
SELECT "POSITION" 포지션, AVG(HEIGHT) "포지션별 평균키"
FROM PLAYER
--WHERE HEIGHT >= 170;
WHERE HEIGHT IS NOT NULL -- NULL 제외
GROUP BY "POSITION" -- 포지션별
;

-- 합: SUM
-- 각 포지션별 BACK_NO의 합을 출력해보자.
SELECT "POSITION", SUM(BACK_NO)
FROM PLAYER
WHERE BACK_NO IS NOT NULL
GROUP BY "POSITION"
;

-- 최대, 최소: MAX, MIN
SELECT PLAYER_NAME, HEIGHT, WEIGHT
FROM PLAYER
-- PLAYER 테이블에서 WEIGHT의 값이 가장 큰 행들의
-- 목록을 가져와라
WHERE WEIGHT = (SELECT MAX(WEIGHT) FROM PLAYER);

-- MIN()
-- HEIGHT가 가장 작은 플레이어의
-- PLAYER_NAME과 HEIGHT 출력
-- 최강조 165
SELECT PLAYER_NAME, HEIGHT
FROM PLAYER
WHERE HEIGHT = (SELECT MIN(HEIGHT) FROM PLAYER);

-- 확인
SELECT PLAYER_NAME, HEIGHT
FROM PLAYER
ORDER BY HEIGHT;

-- GROUP BY를 쓴 경우
-- 그룹에 대하여 조건절을 쓰고 싶은 경우
-- HAVING을 써야 한다.
-- GROUP BY를 하기 전에 조건을 적용하는 것은
-- WHERE절이고, GROUP BY를 한 뒤 조건을 적용하는 것은
-- HAVING절이다.

-- 그룹별 평균 급여를 조회
SELECT DEPARTMENT_ID, AVG(SALARY) "평균급여"
FROM EMPLOYEES
GROUP BY EMPLOYEES.DEPARTMENT_ID
-- 평균 급여가 5천 초과인 부서에 대해서
HAVING AVG(SALARY) > 5000
ORDER BY "평균급여" -- ORDER BY는 모든 조회가 끝난 후에
-- 실행된다.
;

-- EMPLOYEES 테이블에서 DEPARTMENT_ID별 MAX(SALARY)와
-- MIN(SALARY)의 차이를 계산하고
-- 그 차이가 5000 이상인 부서를 조회하라
-- SELECT DEPARTMENT_ID, MAX(SALARY) MAX_SALARY,
-- MIN(SALARY) MIN_SALARY, ---- AS SALARY_GAP
SELECT DEPARTMENT_ID, MAX(SALARY) MAX_SAL, MIN(SALARY) MIN_SAL
, MAX(SALARY) - MIN(SALARY ) AS SAL_GAP
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) - MIN(SALARY ) >= 5000
ORDER BY SAL_GAP DESC
;

SELECT E.DEPARTMENT_ID, MAX_SAL, MIN_SAL, MAX_SAL - MIN_SAL AS SAL_GAP
FROM (
	SELECT DEPARTMENT_ID, MAX(SALARY) MAX_SAL, MIN(SALARY) MIN_SAL
	FROM EMPLOYEES
	GROUP BY DEPARTMENT_ID
	HAVING MAX(SALARY) - MIN(SALARY) >= 5000
) E
ORDER BY SAL_GAP DESC;

--SELECT DEPARTMENT_ID, MAX(SALARY)
--FROM EMPLOYEES
--GROUP BY DEPARTMENT_ID
--;
SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (
	SELECT AVG(SALARY)
	FROM EMPLOYEES
);






