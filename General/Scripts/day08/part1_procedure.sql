-- 프로시저 실습
/* DEPARTMENT_ID를 전달하면 해당 부서의 평균 급여를 구하는
 * 프로시저 만들고 사용하기
 */
CREATE OR REPLACE PROCEDURE AVG_SAL_BY_DEPT_ID
	(P_DEPT_ID IN NUMBER, -- 외부에서 전달받은 값을 저장하는 매개변수
	P_AVG_SAL OUT NUMBER) -- 내부에서 계산된 어떤 값을 외부로 전달하는 매개변수
IS
-- 선언부. 실행부에서 사용할 임시 변수들을 선언하는 공간
BEGIN -- 실행부. SQL문이나 SQL/PL문을 작성하는 공간
	-- 전달된 매개변수와 내부에서 선언한 임시 변수를 활용하여
	-- 어떤 값을 계산한 뒤 그 값을 반환(OUT)하는 로직까지 작성하는 공간
	SELECT AVG(SALARY)
	INTO P_AVG_SAL
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = P_DEPT_ID;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

-- 프로시저 사용
DECLARE
	-- DEPARTMENT_ID의 값이 80인 사람들의 평균 급여를 반환한다.
	V_DEPT_ID NUMBER := 30; -- 부서 ID
	V_AVG_SAL NUMBER; -- 전달받을 값을 저장한 저장공간
BEGIN
	-- 프로시저 호출
	AVG_SAL_BY_DEPT_ID(V_DEPT_ID, V_AVG_SAL);
	-- 결과 출력
	DBMS_OUTPUT.PUT_LINE('부서 ID ' || V_DEPT_ID || '의 평균 급여: ' || FLOOR(V_AVG_SAL));
END;

SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES;


-- EMPLOYEES 테이블에서
-- 전달받은 DEPARTMENT_ID를 가지고, 전달받은 문자를 가장 마지막에 가진
-- 사람들 중 가장 SALARY가 높은 값을 반환하는 프로시저 구현
-- GET_MAX_SAL_VIA_LAST()
CREATE OR REPLACE PROCEDURE GET_MAX_SAL_VIA_LAST
	(P_DEPT_ID IN NUMBER, -- IN
	P_LAST_CHAR IN VARCHAR2, -- IN
	P_MAX_SAL OUT NUMBER)
IS
BEGIN
	SELECT MAX(SALARY)
	INTO P_MAX_SAL
	FROM EMPLOYEES
	WHERE FIRST_NAME LIKE '%' || P_LAST_CHAR
	AND DEPARTMENT_ID = P_DEPT_ID;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%'||'n'
AND DEPARTMENT_ID = 30;

DECLARE
	V_DEPT_ID NUMBER := 30; -- IN
	-- 프로시저를 만드는 쪽에서는 문자의 길이를 정할 필요가 없지만
	-- 사용하는 쪽에서는 그 변수의 크기를 정해서 사용해야 한다.
	V_LAST_CHAR VARCHAR2(10) := 'n'; -- IN
	V_MAX_SAL NUMBER; -- OUT
BEGIN
	GET_MAX_SAL_VIA_LAST(V_DEPT_ID, V_LAST_CHAR, V_MAX_SAL);
	DBMS_OUTPUT.PUT_LINE(
	'부서ID: ' || V_DEPT_ID
	|| '를 가지고 마지막 글자가 ' || V_LAST_CHAR 
	|| '인 사람 중 가장 높은 월급은 ' || V_MAX_SAL || '입니다.');
END;

