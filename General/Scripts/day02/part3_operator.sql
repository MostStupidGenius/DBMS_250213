-- 연산자(operator)
-- 연산자는 피연산자인 데이터를 다른 형태로 변환하거나
-- 데이터간의 비교를 통해 어떤 조건식을 적용하고 싶을 때
-- 사용하는 특수한 기호이다.

-- 1. 연결 연산자(concatenation)
-- shift + \ => |
-- || 연산자는 두 개 이상의 문자열을 하나의 문자열로
-- 연결할 때 사용한다.
-- '홍' || '길동'
-- '홍길동'
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
, FIRST_NAME, LAST_NAME
FROM EMPLOYEES;

-- ALIAS
-- 컬럼명을 사용자 마음대로 변경할 수 있는 방법이다.
-- SELECT 컬럼명 AS "바꿀 컬럼명"
-- AS는 생략할 수 있다.
-- 바꿀 컬럼명에 공백문자나 단어 자체가 예약어가 아니라면
-- 큰따옴표"도 생략 가능하다.
SELECT FIRST_NAME "바꿀 컬럼명"
FROM EMPLOYEES;

-- 산술 연산자(Arithmetic)
-- 수학적 계산을 수행할 때 사용하는 연산자
-- +더하기, -빼기, *곱하기, /나누기
SELECT SALARY 월급, SALARY * 12 AS "연봉"
FROM EMPLOYEES;

-- 관계 연산자(비교 연산자) Comparison
-- 두 값을 비교할 때 사용된다.
-- 연산 결과 값이 true 혹은 false로 나온다.
-- =같다
SELECT *
FROM EMPLOYEES
-- DEPARTMENT_ID가 50과 같은 행에 대해서 필터링
WHERE DEPARTMENT_ID = 50;

-- != <> 다르다
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID != 50;

-- > < >= <= 크기 비교
SELECT SALARY
FROM EMPLOYEES
-- SALARY가 10000 이상인 경우
WHERE SALARY >= 10000
ORDER BY SALARY;

-- WHERE 절에서의 SQL 연산자
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
-- 5000 이상 10000 이하
-- BETWEEN A AND B
-- A 이상 B 이하의 숫자 범위에 해당하는 경우
WHERE SALARY BETWEEN 5000 AND 10000
ORDER BY SALARY;

-- IN
-- WHERE 컬럼명 IN (값1, 값2,...)
-- 해당 컬럼의 값이 값들 중 하나인 경우
-- 특정 값 집합에 포함되는지 여부
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 30)
ORDER BY DEPARTMENT_ID;

-- 문자열이 특정 패턴인 경우
-- LIKE
-- 등호=로 값을 비교하는 것은 정확히 똑같은 경우만 확인하기 때문에
-- 특정 패턴을 파악하기는 힘들다.
-- 문자열 내의 특정 문자열이 있거나 하는 등의 패턴을
-- 확인하기 위해서는 LIKE 예약어를 쓴다.
-- 마지막에 E라는 문자가 오는 경우
-- WHERE NAME LIKE '%E'

-- 중간에 CH라는 문자열이 오는 경우
-- WHERE NAME LIKE '%CH%'

-- ALEX로 시작하는 문자열인 경우
-- WHERE NAME LIKE 'ALEX%'

SELECT FIRST_NAME
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE 'J%n'
WHERE FIRST_NAME LIKE 'A%'
ORDER BY FIRST_NAME
;
-- LIKE 연산자는 대소문자를 구분하기 때문에
-- 이 부분만 주의한다.
