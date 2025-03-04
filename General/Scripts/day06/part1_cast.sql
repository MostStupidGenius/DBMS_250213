-- part1_set_cast.sql
-- 형변환 함수
-- 데이터 테이블에서 사용하는 데이터 타입의 형태를
-- 다른 형태로 변환시켜주는 함수를 가리킨다.
-- 날짜 -> 문자열, 문자열 -> 날짜, 문자열 -> 숫자

-- TO_CHAR()함수
-- 숫자나 날짜 문자열을 사용자 정의 형식에 따라 그 값을 정해놓은
-- 형식에 맞게 값을 배열하는 함수다.

-- SYSDATE -> 현재 시간을 출력

-- TO_CHAR의 두번째 인자는 문자열로, 형식 지정자를 포함하여
-- 해당 형식에 맞는 값을 가져와야 한다.
-- 날짜 형식에서 쓸 수 있는 형식 지정자 중 특수 문자는
-- 대시(-), 콜론(:), 공백문자( ), 언더바(_) 등 몇 가지로 제한된다.
-- 형식 지정자 내에 한글 입력은 불가하며, 한글을 삽입하고자 하는 경우
-- 연결 연산자(||)를 사용하여 문자열 간에 결합을 해야 한다.
SELECT TO_CHAR(SYSDATE, 'YYMMDD.HH24_MI:SS') AS 현재시간
FROM DUAL;

-- 숫자에 대해서는 정수와 소수부로 나뉜다.
-- 표현하고자 하는 숫자의 자릿수와 소숫점 아래 소수 부분을
-- 숫자 9의 개수로 표현해야 한다.
-- 숫자를 문자로 바꿀 때 사용할 수 있는 특수문자는 $와 콤바,과 마침표.뿐이다.
SELECT TO_CHAR(1234567.1239, '$9,999,999.999')
FROM DUAL;

-- TO_NUMBER
-- 문자열을 숫자로 변환한다. 문자열로 저장된 수치 데이터를
-- 수학적 연산에 사용할 수 있게 해준다.
-- TO_CHAR()함수와 다르게,
-- 소숫점 아래의 자릿수를 원래 자릿수보다 더 많이 주어야 한다.
SELECT TO_NUMBER('1,234.567', '999,999.999') AS 숫자로_변환
--SELECT TO_NUMBER('1,234', '999,999')*3 AS 숫자로_변환
FROM DUAL;

-- TO_DATE 함수
-- 문자열의 날짜 형식으로 된 값들을 날짜 데이터 타입으로 변환한다.
-- 다양한 날짜 형식의 문자열을 일관된 데이터로 뽑아서 사용할 수 있다.
-- 원본 문자열의 날짜 데이터값이, TO_DATE()함수에 의해
-- 형변환될 수 있는 형식을 가져야 동작할 수 있다.

-- 정확한 위치에 정확한 범위의 숫자가 위치한다면,
-- 사용자가 정의한 형식대로 날짜 값으로 변환해준다.
SELECT TO_DATE('220207 14:31:19', 'YYDDMM HH24:MI:SS') 날짜로_변환
-- 극단적으로 형태를 바꾼 예시
--SELECT TO_DATE('220207 11:31:19', 'HH24MISS MM:YY:DD') 날짜로_변환
FROM DUAL;

-- 세션의 언어 설정 변경 방법
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'JAPANESE';

-- 세션의 언어 설정에 따라, 각 언어별 월, 일을 표현하는 방법이 달라진다.
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD MON')
FROM DUAL;

-- CAST() 함수
-- CAST(값 AS 타입)
-- 다양한 데이터 타입간의 형변환을 제공하는 함수.
-- SQL표준을 따르며 다른 DBMS와의 호환성을 위해 자주 사용된다.
SELECT CAST('1234' AS NUMBER) AS 숫자,
CAST(SYSDATE AS VARCHAR2(20)) AS 날짜문자열,
CAST('2025-02-27' AS DATE) AS 날짜로변환
FROM DUAL;

-- 실습
SELECT PLAYER_ID, PLAYER_NAME
, NVL(JOIN_YYYY, TO_CHAR(BIRTH_DATE, 'YYYY')) "JOIN"
, BIRTH_DATE 
FROM PLAYER;
--WHERE PLAYER.JOIN_YYYY IS NULL;