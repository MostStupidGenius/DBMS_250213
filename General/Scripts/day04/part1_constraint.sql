-- 제약조건
-- PK(기본키) primary key
-- 모든 테이블에 반드시 하나만 존재할 수 있는 제약조건으로
-- 하나의 컬럼을 지정하거나 혹은 두 개 이상의 컬럼을 조합하여
-- 조합키로 PK를 지정할 수 있다.
-- PK는 각 레코드를 고유하게 구분하기 위한 식별자 역할을 한다.
	-- 특징
	-- NULL값x, 중복x
-- PK를 설정하는 것으로 다른 테이블에서 FK로 설정하여
-- 각 레코드와의 관계에 일관성을 부여할 수 있다.
CREATE TABLE TBL_TEST (
	NUM NUMBER PRIMARY KEY,
	NAME VARCHAR2(100)
);

-- FK(외래키) foreign key
-- 다른 테이블의 PK에 해당하는 컬럼을 참조하기 위해
-- 사용하는 제약조건으로, 임의로 설정한 컬럼에 FK를 설정하여
-- 다른 테이블의 PK값이 존재하는 경우, 연결하는 역할을 한다.
-- 테이블간의 관계를 설정, 참조 무결성을 유지한다.
-- 참조되는 테이블의 데이터가 삭제되었을 때,
-- 따라서 삭제될지(CASCADE), 혹은 FK값을 NULL로 변경할지(SET NULL)
-- 등을 설정할 수 있다.

CREATE TABLE TBL_TEST_SCORE (
	SCORE_NUM NUMBER PRIMARY KEY,
	TEST_NUM NUMBER, -- FK로 설정할 컬럼
--	SCORE NUMBER,
	-- 제약조건을 설정
	-- 현재 테이블에서 FK로 설정할 컬럼을 적는다.
	CONSTRAINT SCORE_FK -- 제약조건 이름 설정
	FOREIGN KEY (TEST_NUM) -- 대상 컬럼 설정
	-- 참조 대상이 되는 테이블과 그 컬럼명을 적는다.
	REFERENCES TBL_TEST(NUM)
);

--DROP TABLE TBL_TEST_SCORE;

-- 과목 테이블
-- 과목명에 대해서 UNIQUE 설정
-- UNIQUE 키워드
-- 해당 컬럼은 중복이 불가능하지만 NULL값은 허용하는
-- PK가 아닌 컬럼에 적용하는 제약조건이다.
-- 무관계 테이블로 설정
CREATE TABLE TBL_SUBJECT (
	SUBJ_NUM NUMBER PRIMARY KEY,
	SUBJ_NAME VARCHAR2(100) UNIQUE, -- 과목명은 중복 불가
	PROP_NUM NUMBER
);

-- NOT NULL
-- 해당 컬럼은 INSERT로 값을 넣을 때,
-- 반드시 값을 설정해야 하는 강제성을 부여한다.
-- CHECK
-- 조건식을 걸어서 조건식을 만족하지 않는 값이 입력되면
-- 테이블로의 입력을 거부한다.
-- DEFAULT
-- 해당 컬럼의 값을 입력하지 않았을 경우,
-- 기본값을 설정하여 NULL값이 되지 않도록 한다.
-- 예시) 보통 가입일과 같은 날짜를 SYSDATE 키워드를
-- DEFAULT로 설정하여 자동으로 현재날짜가 기입되도록
-- 설정한다.
CREATE TABLE 학생 (
	학번 NUMBER PRIMARY KEY, -- PK
	이름 VARCHAR2(50) NOT NULL, -- NULL 비허용
	-- 입력값 제한
	나이 NUMBER CHECK(나이 BETWEEN 1 AND 100),
	이메일 VARCHAR2(100) UNIQUE, -- 중복 불허, NULLABLE
	-- 값을 입력하지 않았을 경우, 자동으로 INSERT하는 그 시간을 입력
	입학일 DATE DEFAULT SYSDATE,
	성별 CHAR(1) CHECK (성별 IN ('남', '여')),
	학과코드 NUMBER -- FK로 설정할 컬럼
--	, FOREIGN KEY (학과코드) REFERENCES 학과(학과코드)
);

CREATE TABLE TBL_CLASS (
	ID NUMBER, -- 나중에 PK로 제약조건 설정
	CLASS_NAME VARCHAR2(50),
	CLASS_ROOM_NUM NUMBER, -- FK
	MAX_PEOPLE NUMBER -- CHECK(MAX_PEOPLE > 0)
);
-- 클래스룸 테이블 생성
CREATE TABLE TBL_CLASS_ROOM (
	NUM NUMBER PRIMARY KEY,
	"SIZE" NUMBER CHECK("SIZE" > 0)
);

-- TBL_CLASS의 ID 컬럼을 PK로 설정
-- ALTER TABLE 테이블명
-- ADD CONSTRAINT 제약조건명
-- PRIMARY KEY (컬럼명)
ALTER TABLE TBL_CLASS
ADD CONSTRAINT PK_CLASS
PRIMARY KEY (ID);

-- TBL_CLASS의 CLASS_ROOM_NUM을
-- TBL_CLASS_ROOM의 NUM 컬럼에 대한 FK로 설정
ALTER TABLE TBL_CLASS
ADD CONSTRAINT FK_ROOM_NUM
FOREIGN KEY (CLASS_ROOM_NUM)
REFERENCES TBL_CLASS_ROOM(NUM);

-- TBL_CLASS의 MAX_PEOPLE에 대해서
-- CHECK로 0보다 큰 값이 들어가도록 설정
ALTER TABLE TBL_CLASS
ADD CONSTRAINT CK_CLASS_MAX
CHECK(MAX_PEOPLE > 0);

-- 제약조건의 삭제
-- ALTER TABLE 테이블명
-- DROP CONSTRAINT 제약조건명;
ALTER TABLE TBL_CLASS
DROP CONSTRAINT CK_CLASS_MAX;

-- PK의 경우엔 제약조건명이 따로 없기 때문에
-- DROP PRIMARY KEY;
-- 위와 같이 적으면 PK 조건을 제거할 수 있다.
ALTER TABLE TBL_CLASS
DROP PRIMARY KEY;