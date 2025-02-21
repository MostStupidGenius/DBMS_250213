-- part2_sequence.sql

-- 시퀀스(SEQUENCE)
-- 고유한 숫자값을 순차적으로 자동 생성하는 객체
-- 주로 PK값을 자동으로 생성하는 데 사용된다.
-- 자동으로 증가하는 숫자를 생성(시작값, 등차값 조정)
-- 여러 테이블에서 공유 가능
-- 메모리에 캐시 가능(빠른 액세스), NO CACHE 가능
-- 테이블에 종속된 객체가 아니기 때문에
-- 동시성 문제를 해결할 수 있다.

-- 시퀀스 생성구문
-- 필수 구문
CREATE SEQUENCE SEQ_STUDENT_ID;
-- 아래는 옵션 구문
START WITH 10 -- 시퀀스의 시작값을 설정(기본값 1)
INCREMENT BY 2 -- 등차값을 설정(기본값 1)
MAXVALUE 99 -- 최대값 설정(기본값은 사실상 무제한)
MINVALUE 0 -- 최소값 설정(기본값 1)
CYCLE -- 최대값에 도달했을 시, 시작값에서 다시 시작할지
-- 기본값 순회하지 않음
CACHE 20; -- 캐시를 설정하여 빠른 액세스를 돕는다.

DROP SEQUENCE SEQ_STUDENT_ID;

-- 시퀀스의 사용
CREATE TABLE TBL_STUDENT (
	STUDENT_ID NUMBER PRIMARY KEY,
	NAME VARCHAR2(100) NOT NULL,
	AGE NUMBER CHECK(AGE > 10 AND AGE < 100)
);
DROP TABLE TBL_STUDENT;

-- 버전 이슈
-- 12c 이전 버전에선 DEFAULT값으로 NEXTVAL을 사용할 수 없다.
--ALTER TABLE TBL_STUDENT
--MODIFY (STUDENT_ID DEFAULT SEQ_STUDENT_ID.NEXTVAL); 

-- SEQ.NEXTVAL을 먼저 실행해야(다음 시퀀스를 반환 + 값 증가)
-- SEQ.CURRVAL을 사용할 수 있다.(현재 시퀀스를 반환)
--SELECT SEQ_STUDENT_ID.NEXTVAL
--FROM DUAL;

-- 데이터 입력 시 시퀀스의 사용
INSERT INTO TBL_STUDENT(STUDENT_ID, NAME, AGE)
--VALUES (SEQ_STUDENT_ID.NEXTVAL, '홍길동', 24);
--VALUES (SEQ_STUDENT_ID.NEXTVAL, '고길동', 25);
--VALUES (SEQ_STUDENT_ID.NEXTVAL, '둘리', 12);
--VALUES (SEQ_STUDENT_ID.NEXTVAL, '또치', 14);

SELECT *
FROM TBL_STUDENT;

-- 시퀀스의 장단점
-- 고유한 숫자값을 쉽게 생성할 수 있다.
-- 코드의 재사용성을 높일 수 있다.

-- 시퀀스 값 사이에 갭이 생길 수 있다.
	-- 데이터를 삭제하는 경우에도 시퀀스는
	-- 빈 공간을 채우진 않는다.
-- 롤백(실행 코드 실행 취소) 시에는 시퀀스 값이 회수되지 않는다.