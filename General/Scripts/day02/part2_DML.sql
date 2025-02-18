-- DML
/* 데이터베이스의 테이블에 데이터를
 * 직접 삽입하고 수정하고 조회하고 삭제하는 등
 * 데이터를 직접 조작하는 데이터 조작어를 DML이라 부른다.
 * */
-- SELECT
-- SELECT FROM WHERE
SELECT *        -- 조회하려는 컬럼명을 적는 곳 
-- *은 "모든 컬럼"을 조회하겠다라는 의미이다.
FROM EMPLOYEES; -- 조회하려는 테이블명을 적는 곳
WHERE ;-- 조회할 컬럼에 조건을 걸어두는 곳

-- 여러 컬럼을 지정하여 조회하고 싶다면
-- 반점,으로 구분하여 여러 컬럼을 순서대로 조회할 수 있다.
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.FIRST_NAME
FROM EMPLOYEES e 
;

-- WHERE절을 이용하여 데이터를 필터링하여
-- 조회해보자.
-- WHERE 조건식
-- 조건식이란, 결과값이 예(TRUE) 혹은
-- 아니오(FALSE)로 나오는 식
-- WHERE 컬럼명 = 값
SELECT *
FROM EMPLOYEES
--WHERE DEPARTMENT_ID = 90;
WHERE SALARY > 4000;

-- DISTINCT
-- 중복 제거를 하기 위한 키워드(색깔이 바뀌는)
-- DISTINCT는 SELECT 바로 뒤에 써야 하며,
-- 여러 컬럼을 조회하게 되면, 컬럼들 값의 조합의 중복을
-- 제거하여 조회한다.
-- 일반적으로 DITINCT 뒤에는 컬럼명 하나만 온다.
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DEPARTMENT_ID, SALARY
FROM EMPLOYEES
--WHERE 
-- ORDER BY는 정렬할 컬럼을 지정하여
-- 정렬 방법에 따라 정렬하게 하는 기능이다.
-- 이때, 여러 컬럼을 지정하면,
-- 먼저 쓴 컬럼의 값이 동일할 경우에
-- 다음에 쓴 컬럼의 값을 비교하여 정렬한다.
--ORDER BY SALARY; -- SALARY 열에 대해서만 정렬
-- 부서ID를 먼저 정렬한 뒤, 같은 부서ID를 가진 경우
-- SALARY로 오름차순 정렬
ORDER BY DEPARTMENT_ID, SALARY DESC;

-- ROWNUM
-- 행 번호를 지칭하는 대명사 역할로
-- WHERE문에서 조건식으로 행의 개수를 제한할 수 있다.
-- ROWNUM으로 행 수를 제한할 때
-- 반드시 1이 그 범위 안에 들어가야 한다.
SELECT *
FROM EMPLOYEES
WHERE ROWNUM <= 10
ORDER BY EMPLOYEE_ID DESC;

-- ※테이블을 생성한 뒤 따라한다.
-- 데이터를 테이블에 삽입
-- INSERT INTO 테이블명 (컬럼1, 컬럼2,...)
-- VALUES (VALUE1, VALUE2,...);

-- 데이터 삽입 전에 구조를 확인한다.
SELECT *
FROM STUDENT;

INSERT INTO STUDENT (STUDENT_ID, NAME, BIRTH_DATE)
VALUES (1, '홍길동', TO_DATE('2000-01-01'));

-- 여러 행 삽입
INSERT ALL
	INTO STUDENT (STUDENT_ID, NAME, BIRTH_DATE)
	VALUES (2, '고길동', TO_DATE('2001-01-01'))
	INTO STUDENT (STUDENT_ID, NAME, BIRTH_DATE)
	VALUES (3, '김길동', TO_DATE('2001-01-01'))
	INTO STUDENT (STUDENT_ID, NAME, BIRTH_DATE)
	VALUES (4, '이길동', TO_DATE('2001-01-01'))
	INTO STUDENT (STUDENT_ID, NAME, BIRTH_DATE)
	VALUES (5, '하길동', TO_DATE('2001-01-01'))
SELECT * FROM DUAL;

-- UPDATE
-- 데이터 수정
-- 조건식을 만족하는 행들에 대해서 SET에 적은 대로
-- 값을 변경하는 명령문이다.

--UPDATE 테이블명
--SET 컬럼명=값, 컬럼명=값,... 
--WHERE 조건식;

-- STUDENT 테이블에서
-- NAME이 '김길동'인 경우, STUDENT_ID를 6으로 변경
UPDATE STUDENT
SET STUDENT_ID=66
WHERE NAME='김길동';

-- UPDATE문에서 조건식을 주는 이유는, 조건식이 없으면
-- 모든 행에 대해서 SET에 적힌 내용으로 그 값을 변경하기 때문이다.
-- WHERE 절을 쓰지 않는 경우, 경고문이 뜬다.
SELECT *
FROM STUDENT;

SELECT *
FROM DUAL;

-- DELETE문
-- 조건에 맞는 행의 데이터를 삭제하는 명령문
-- DELETE FROM 테이블명 WHERE 조건식;
DELETE FROM STUDENT
WHERE STUDENT_ID = 4;

SELECT *
FROM STUDENT;

-- DELETE문과 TRUNCATE문의 차이점
-- DELETE문은 로그가 남기 때문에 그 속도가 느리고 롤백이 가능하다
-- TRUNCATE문은 로그가 남지 않고 구조만 남기고 내용을 삭제한다.
-- TRUNCATE는 속도가 빠르다.




