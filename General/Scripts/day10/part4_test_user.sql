-- part4_test_user.sql
-- TEST_USER 사용자는 HR스키마의 EMPLOYEES 테이블에 대한
-- SELECT 권한을 가지고 있다.
SELECT *
FROM HR.EMPLOYEES;

SELECT *
FROM HR.DEPARTMENTS;

-- DBeaver에서 권한이 없는 것을 확인 후
-- cmd창에서 sqlplus sys/1234 as sysdba 명령어를 통해 입장하여
-- HR 스키마의 PLAYER 테이블에 대한 SELECT 권한을 부여한 뒤
-- cmd창을 하나 더 띄워 test_user로 접속하여 권한을 확인해보자.
-- test_user/1234

-- DCL은 트랜잭션의 영향을 받지 않기 때문에
-- ROLLBACK이나 COMMIT과 무관하게 실행 후 바로 적용된다.
SELECT *
FROM HR.PLAYER;





