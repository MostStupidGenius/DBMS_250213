-- part3_nvl.sql

-- NULL값과 NVL함수
-- NULL이란 값이 없는 그 상태를 명시적으로 가리키는 값이다.
-- NULL은 비교 연산시 그 결과값이 항상 NULL이다.(알 수 없음)

-- NVL함수
-- 확인하려는 컬럼의 값이 NULL이 아니라면 기존값으로 반환
-- NULL이라면 정해놓은 값으로 반환되도록 하여
-- NULL값으로 반환되지 않도록 설정하는 것이 목적이다.

SELECT PLAYER_NAME,
-- NICKNAME의 값이 NULL이라면 PLAYER_NAME으로 대체
-- NICKNAME의 값이 NULL이 아니라면 기존 NICKNAME의 값으로 조회
NVL(NICKNAME, 'N ' || PLAYER_NAME)
FROM PLAYER;

-- NVL2()함수
-- NVL2(컬럼명, NULL아닌경우값, NULL인경우값)
SELECT PLAYER_NAME
, NVL2(NICKNAME, 'O', 'X') 닉네임여부 
--, NICKNAME
FROM PLAYER;