-- JOIN
-- 두 개 이상의 테이블을 기준이 되는 컬럼의 값이 같은 경우에
-- 두 테이블을 마치 하나의 테이블처럼 만든 결과를 가상의 테이블로 
-- 출력한다.

-- INNER JOIN
-- 교집합. 조건에 충족하는 레코드만 조인되어 테이블에 표현된다.
-- 조건을 충족하는 '관계'를 보기 위해 주로 사용된다.
-- JOIN만 쓰는 경우 INNER 예약어를 생략한 것으로 간주한다.

SELECT *
FROM EMPLOYEES;

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID;

SELECT *
FROM DEPARTMENTS ;

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
, D.MANAGER_ID, E.FIRST_NAME, E.LAST_NAME
FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;
-- DEPARTMENTS의 MANAGER_ID와
-- EMPLOYEES의 MANAGER_ID가 같을 경우에 조인
-- DEPARTMENTS의 레코드 중, MANAGER_ID가 없는 경우는
-- 결과에 포함하지 않는다.

-- 부서 테이블의 매니저 아이디는 직원 테이블의 직원 아이디와 같다.
-- 이 아이디들을 기준으로 조인하여
-- 각 부서별 매니저의 이름을 출력할 수 있다.

-- =========OUTER JOIN==========
-- 외부 조인은 조건에 맞지 않는 데이터가 있을 경우,
-- 외부 조인의 방향에 따라 해당 테이블에서 조인되지 않은
-- 레코드도 출력에 포함시킨다.
-- LEFT, RIGHT, FULL
-- JOIN문 기준으로, FROM절에 있는 테이블을 왼쪽으로 간주하고
-- JOIN문에 있는 테이블을 오른쪽으로 간주한다.
-- 해당 방향의 테이블을 기준으로 조인을 하며,
-- 기준이 된 테이블의 모든 레코드는 조인여부와 상관없이
-- SELECT문에 포함된다.

SELECT D.DEPARTMENT_ID 부서번호 , D.DEPARTMENT_NAME 부서명
, D.MANAGER_ID 매니저번호
, E.EMPLOYEE_ID, E.FIRST_NAME 성 , E.LAST_NAME 이름
FROM DEPARTMENTS D
RIGHT JOIN EMPLOYEES E
ON D.MANAGER_ID = E.EMPLOYEE_ID;

-- FULL OUTTER JOIN
-- 양쪽의 모든 레코드를 조인 여부와 관계없이 모두 표현
-- 최대 양쪽 레코드의 행 개수를 합한 개수만큼 나올 수도 있다.

SELECT S.STADIUM_NAME, S.HOMETEAM_ID
, T.TEAM_ID , T.TEAM_NAME
FROM STADIUM S
FULL JOIN TEAM T
ON S.HOMETEAM_ID = T.TEAM_ID;