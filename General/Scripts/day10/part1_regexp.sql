-- part1_regexp.sql
/* 정규식(정규표현식): Regular Expression
 * 문자열을 다루기 위해 대부분의 IT 분야에서 사용하는 표현식으로
 * 주로 특정 문자열 안에서 원하는 문자열이 있는지 검색, 추출, 대체 등의 동작을
 * 수행하기 위해 찾고자 하는 문자열을 표현하는 식을 만드는 방법을 가리킨다.
 * 학습목표: 정규표현식인지만 인식하거나 어떤 상황에서 정규표현식을 사용해야 하는지
 * 정도만 학습하는 것을 목표로 한다.
 */
-- REGEXP_LIKE(컬럼명, 정규표현식문자열)
-- 정규표현식에 해당하는 문자열의 존재 여부를 검사하는 함수 -> TRUE/FALSE
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
-- A라는 문자열로 시작하는지 여부 -> LIKE 'A%'
WHERE REGEXP_LIKE(FIRST_NAME, '^A.*')
;

-- REGEXP_SUBSTR(문자열값OR컬럼, 정규표현식문자열)
-- 해당되는 패턴의 문자열을 추출하는 함수
-- 대문자 H부터 대문자 W까지이거나 e, l, o인 문자열이 연속적으로 등장한 경우
-- 한 세트로 하여 추출 후 반환
SELECT REGEXP_SUBSTR('!HelloWorld', '[H-Welo]+') 추출문자열
FROM DUAL;

-- REGEXP_REPLACE(문자열OR컬럼명, 그룹이포함된정규식, 그룹참조가포함된문자열)
-- 정규표현식에 해당하는 그룹들()을 참조변수(\1, \2,..)를 이용하여
-- 새로운 문자열을 재구축하는 함수
SELECT REGEXP_REPLACE('010!1234@4321',
	'([[:digit:]]{3})[!@-]?([[:digit:]]{4})[!@-]?([[:digit:]]{4})',
	'\2\3') 문자열재구성
FROM DUAL;

-- REGEXP_INSTR
-- 정규표현식과 일치하는 위치 중 가장 작은 순서값을 인덱스로 반환
SELECT REGEXP_INSTR('Hello World', '[o]') 인덱스
FROM DUAL;