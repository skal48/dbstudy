/* 
    집합
    1. 2개 이상의 테이블을 한 번에 조회하는 방식 중 하나이다. 
    2. 모든 SELECT 절의 칼럼 순서와 타입이 일치해야 한다. 
    3. 집합연산자 
        1) UNION     : 합집합, 중복 값은 한 번만 조회 
        2) UNION ALL : 합집합, 중복 값도 그대로 조회
        3) INTERSECT : 교집합, 중복 값은 한 번만 조회
        2) MINUS     : 차집합, 첫 번째 SELECT 결과에서 두번째 SELECT 결과를 뺀다. 
    4. 형식 
        SELECT 칼럼1, 칼럼2, ...
          FROM 테이블1
          집합연산자
        SELECT 칼럼1, 칼럼2 
          FROM 테이블2
        [ORDER BY 정렬]
*/

--합집합
SELECT 1, 2
  FROM DUAL
UNION
SELECT 3, 4
 FROM DUAL;

SELECT 1, 2
 FROM DUAL
UNION     --중복을 제거한 합집합
 SELECT 1, 2
 FROM DUAL;
 
SELECT 1, 2
 FROM DUAL
 UNION ALL  -- 중복을 그대로 조회하는 합집합
 SELECT 1, 2
 FROM DUAL;
 
-- 사원 테이블과 부서테이블에 존재하는 모든 부서번호를 조회하기  
 SELECT DEPARTMENT_ID
   FROM DEPARTMENTS
  UNION
 SELECT DEPARTMENT_ID
   FROM EMPLOYEES;
 
 SELECT DEPARTMENT_ID
   FROM DEPARTMENTS
  UNION ALL
 SELECT DEPARTMENT_ID
   FROM EMPLOYEES;
  
--사원테이블과 부서테이블에 모두 존재하는 부서번호 조회하기 
--(사원들이 근무 중인 부서번호만 조회하기 )
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
INTERSECT
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;

--부서 테이블에 존재하지만 사원 테이블에 존재하지 않는 부서번호 조회하기 
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 MINUS
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  

  
  
  
  
-- 교집합
SELECT 1, 2
  FROM DUAL
INTERSECT
SELECT 2, 3
  FROM DUAL;








 
 