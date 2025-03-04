-- part3_procedure.sql
/* 프로시저
 * 프로시저는 미리 작성해놓은 SQL문을 전달받은 값에 따라
 * 동적으로 결과를 바꿔서 반환하는 일종의 함수라고 볼 수 있다.
 * - 미리 만들어서 DB에 저장하기 때문에 실행속도가 빠르다.
 * - 자주 사용하는 것을 프로시저로 만들어두면 생산성이 증가한다.
 * - 복잡한 동작을 한번만 만들어두면 프로시저를 이용하여 쉽게 구현을 할 수 있다.
 * - 프로시저를 통해서만 CRUD를 하면 보안성을 강화할 수 있다.(제한적 접근)
 * 
 * 문법 구조
 * CREATE OR REPLACE PROCEDURE 프로시저명
 * (매개변수1 [받을지 돌려줄지->IN | OUT | IN OUT] 데이터타입,
 * 매개변수2...,
 * )
 * IS | AS
 * 		선언부 - 내부에서 사용할 변수 만들기
 * BEGIN 
 * 		실행부 - 위에서 전달받거나 선언한 변수를 사용하여 실행할 동작을 작성하는 곳
 * 		SQL문 또는 PL/SQL문(동작)
 * EXCEPTION
 * 		예외처리부 - 문제가 발생했을 때, 동작을 중지하고
 * 				이곳의 내용을 실행한다.(주로 ROLLBACK; 실행)
 * END;
 *  */
-- 전달된 EMPLOYEE_ID값을 가진 사람의 월급을
-- 전달된 값% 만큼 증가시키는 프로시저 만들기
CREATE OR REPLACE PROCEDURE UPDATE_SALARY (
	P_EMP_ID IN NUMBER, -- 대상 직원 ID
	P_RAISE_PER IN NUMBER) -- 증가시킬 월급 %
IS -- 선언부
BEGIN -- 실행부
	UPDATE EMPLOYEES
	SET SALARY = SALARY + (SALARY * P_RAISE_PER/100)
	WHERE EMPLOYEE_ID = P_EMP_ID;
--	COMMIT; -- 해당 내용 확정 저장
EXCEPTION -- 예외처리부
 	WHEN OTHERS THEN
 		ROLLBACK; -- 저장하지 않고 원상복구
 		-- 에러 출력
		RAISE_APPLICATION_ERROR(-20001, '급여 수정 중 오류 발생');
END;

BEGIN
	-- 직원ID가 100인 사람의 월급을 10% 인상
	UPDATE_SALARY(100, 10);
END;

SELECT EMPLOYEE_ID, SALARY
FROM EMPLOYEES;

ROLLBACK;












