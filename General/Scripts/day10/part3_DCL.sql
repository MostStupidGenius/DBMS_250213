-- part3_DCL.sql
/* 상단에서 N/A 중 가운데 있는 Database를 클릭하여
 * sysdba 권한으로 연결된 데이터 베이스 연결을 선택한다.
 * 세번째 N/A가 sys로 바뀐다.
 * 이제 sysdba 권한으로 DCL 명령어를 사용할 수 있다.
 */

-- DCL(Database Control Language)
/* 기존의 데이터베이스의 테이블을 정의하는 DDL이나
 * 이미 만들어진 테이블에 데이터를 조작하는 DCL처럼
 * 계정을 생성하고 권한을 부여하는 등의 접근 권한 제어를 위한 명령어가
 * 바로 DCL이다.
 * 일반적으로 신입 DBA에게는 주지 않는 권한이며, 경력이 쌓였을 때
 * 실무에서 사용할 수 있게 된다.
 * DCL도 마찬가지로 CRUD를 기본으로 삼으며, 그 대상을 USER로 한다.
 * */
-- 사용자 생성
-- CREATE USER 유저명 IDENTIFIED BY 비밀번호;
CREATE USER TEST_USER IDENTIFIED BY 1234;

-- 사용자 삭제
DROP USER TEST_USER;

-- 특정 사용자 혹은 역할에 권한 부여
-- GRANT 명령어종류 대상 TO 유저명

-- 예)특정 유저에게 CREATE TABLE, CREATE VIEW를 사용할 수 있는 권한을 부여
GRANT CREATE TABLE, CREATE VIEW TO TEST_USER;

-- 특정 사용자에게 역할을 부여
GRANT CONNECT, RESOURCE TO TEST_USER;

-- 특정 테이블에 대한 사용자의 접근 권한 부여
-- GRANT DML/DDL ON 스키마명.테이블명 TO 유저명;
-- GRANT
-- ON
-- TO
GRANT SELECT, INSERT ON HR.EMPLOYEES TO TEST_USER;

-- 특정 사용자의 권한 확인
SELECT *
FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'TEST_USER';

-- 특정 사용자의 역할(ROLE) 확인
SELECT *
FROM DBA_ROLE_PRIVS
WHERE GRANTEE = 'TEST_USER';


-- 특정 사용자의 권한 회수
-- REVOKE 권한 ON 스키마명.테이블명 FROM 유저명;
-- REVOKE
-- ON
-- FROM
REVOKE INSERT ON HR.EMPLOYEES FROM TEST_USER;

-- 실습1. TEST_USER 사용자에게
-- HR 스키마의 DEPARTMENTS 테이블에 대한
-- SELECT 권한을 부여해보자.
GRANT SELECT
ON HR.DEPARTMENTS
TO TEST_USER;



