-- INDEX
-- 테이블의 컬럼들에 대해서 그 순서에 따른 인덱스를 부여하여
-- 나중에 해당 순서로 정렬할 때, 더 빠른 성능을 기대할 수 있다.
-- 장점: 적절한 인덱스를 부여할 경우 더 빠른 검색 성능을 보여주지만
-- 단점: 불필요한 인덱스를 부여하면 오히려 데이터베이스 성능이 저하될 수 있다.
-- 인덱스라는 별도의 데이터 구조에 저장하는 것이기 때문에
-- 별도의 저장공간을 필요로 하게 된다.
-- 상황에 따라서는 인덱스를 재구성하거나 통계 업데이트를 통해
-- 지속적으로 관리해주어야 한다.
CREATE TABLE TBL_EMPLOYEES(
	ID NUMBER PRIMARY KEY,
	FIRST_NAME VARCHAR2(50),
	LAST_NAME VARCHAR2(50),
	EMAIL VARCHAR2(100) UNIQUE,
	HIRE_DATE DATE
);


INSERT INTO TBL_EMPLOYEES(
	ID, FIRST_NAME, LAST_NAME, EMAIL
)
--VALUES(1, '고', '길동', 'test1@gmail.com');
--VALUES(2, '김', '길동', 'test2@gmail.com');
--VALUES(3, '이', '길동', 'test3@gmail.com');
--VALUES(4, '박', '길동', 'test4@gmail.com');

-- IDX_EMPLOYEES_NAME이라는 이름을 부여받은 인덱스를 생성
CREATE INDEX IDX_EMPLOYEES_NAME 
-- TBL_EMPLOYEES의 LAST_NAME과 FIRST_NAME을 조합한 값을
-- 한 세트로 하여 인덱스를 부여하겠다.
ON TBL_EMPLOYEES(LAST_NAME, FIRST_NAME);




