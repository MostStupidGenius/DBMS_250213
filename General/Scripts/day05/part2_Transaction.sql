-- 트랜잭션(transaction)
-- SQL문을 통해 DB에 전송하는 가장 작은 작업 단위.
-- 세미 콜론;당 한번이라고 생각하면 된다.
SELECT *
FROM PLAYER;
-- 셀렉트문이든, 인서트문이든, 세미콜론을 기준으로
-- 코드가 한번 실행될 때마다 커밋할 숫자가 증가한다.
-- 이때, 지금까지의 변경사항을 확정하는 것을 커밋(COMMIT)이라 하며
-- 지금까지의 변경사항을 취소하고 NONE이었던
-- 그때로 돌아가는 것을 롤백(ROLLBACK)이라 한다.
--BEGIN TRANSACTION;
-- 현재 테이블 상태 확인
SELECT *
FROM STUDENT;

-- 테이블에 새로운 내용 추가
INSERT INTO STUDENT(STUDENT_ID, NAME)
VALUES(3, '둘리');

-- 마지막으로 커밋했던 시점으로 돌아간다.
ROLLBACK;
