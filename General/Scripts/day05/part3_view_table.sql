-- VIEW TABLE
-- 뷰 테이블은 셀렉트 쿼리문의 결과를 일반 테이블처럼 조회하거나
-- 기타 다른 동작을 수행할 수 있는 가상의 테이블을 가리킨다.

-- CREATE VIEW 뷰테이블이름 AS
-- SELECT * FROM TABLE;
CREATE VIEW PLAYER_INFO AS
SELECT PLAYER_ID ID, PLAYER_NAME 이름
, HEIGHT 키, WEIGHT 몸무게, TEAM_ID
FROM PLAYER;

SELECT *
FROM PLAYER_INFO;
