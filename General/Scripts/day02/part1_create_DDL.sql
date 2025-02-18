-- DDL
/* CREATE - 테이블을 생성한다.
 * ALTER - 테이블의 구조를 변경한다.
 * DROP - 테이블을 삭제한다.
 * TRUNCATE - 테이블의 데이터만 삭제한다.
 * 		- 구조는 남긴다.
 * */
CREATE TABLE STUDENT(
	STUDENT_ID NUMBER, -- 고유한 숫자값
	NAME VARCHAR2(50),
	BIRTH_DATE DATE
);
-- ALTER 테이블의 구조 수정
-- 구조를 어떻게 수정할 것인가 하는 옵션을
-- 적어주어야 한다.
ALTER TABLE STUDENT ADD (
	EMAIL VARCHAR2(100)
);
/* ADD - 새로운 데이터 열(컬럼)을 추가한다
 * DROP COLUMN - 기존 열을 삭제한다.
 * MODIFY - 열의 데이터 타입 변경
 * RENAME COLUMN - 열 이름 변경
 * RENAME TABLE - 테이블명 변경
 * */
ALTER TABLE STUDENT
--RENAME COLUMN EMAIL TO MAIL; -- 컬럼명 변경
--MODIFY MAIL CHAR(100); -- 데이터 타입 변경
--DROP COLUMN MAIL;-- 기존 열 삭제

-- DROP
-- 테이블을 삭제
DROP TABLE STUDENT;

-- TRUNCATE
-- 데이터만 삭제하고 구조는 유지한다.
-- 속도가 빠르고 롤백(복구)할 수 없다.
--TRUNCATE TABLE STUDENT;





