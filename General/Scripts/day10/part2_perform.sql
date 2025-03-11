-- part2_perform.sql
-- 실행 계획 분석
-- 해당 SQL문을 사용했을 때 CPU 사용량과 결과 행의 개수를
-- 일부만 실행하여 예측하는 것을 가리킨다.
EXPLAIN PLAN FOR
SELECT *
FROM EMPLOYEES
WHERE REGEXP_LIKE(FIRST_NAME, '^A.*');

SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- 통계 정보 활용
-- 특정 스키마(ex. HR)의 특정 테이블(ex. EMPLOYEES)에 대한
-- 통계 정보를 조회하여 최적화에 활용한다.

-- 테이블 통계 수집 함수
-- x EXEC DBMS_STATS.GATHER_TABLE_STATS(OWNNAME=>스키마명, TABLENAME=>테이블명);
-- x EXEC DBMS_STATS.gather_table_stats(ownname => 'HR',tablename => 'EMPLOYEES');

-- 해당 코드는 DBeaver에서는 실행이 불가능하며,
-- cmd 창에서 / sqlplus hr/hr /로 sqlplus 환경에 입장한 뒤
-- 아래 코드를 세미콜론;까지 작성하여 실행하면 된다.
-- 스키마 HR에 대한 통계를 갱신하는 명령어다.
--EXEC DBMS_STATS.gather_schema_stats('HR');
-- 대소문자는 상관없다.
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('HR');