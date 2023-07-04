-- 1. 사원테이블에서 FIRST_NAME 과 LAST_NAME 조회
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;
    
SELECT FIRST_NAME AS 이름, LAST_NAME AS 성
  FROM EMPLOYEES;
    

SELECT E.FIRST_NAME AS 이름, E.LAST_NAME AS 성
  FROM EMPLOYEES E;
    
--2. 사원테이블에서 DEPARTMENT_ID의 중복을 제거하고 조회하기 

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
    
--3.사원테이블에서 EMPLOYEE_ID가 150인 사원의 정보 조회하기 .
SELECT  * 
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 150;
        
-- 4. 사원테이블에서 연봉이 10000이상인 사원의 정보 조회하기 
SELECT *
  FROM EMPLOYEES
  WHERE SALARY >= 10000;
        
-- 5. 사원테이블에서 연봉이 10000<, <20000 이하인 사원의 정보 조회하기
SELECT *
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000; --SALARY >=1000 AND SALARY <=20000
        
-- 6. 사원테이블에서 부서번호가 30,40,50 인 사원의 정보조회하기
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(30,40,50); --DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 40 OR DEPARTMENT_ID = 50
        
-- 7. 사원 테이블에서 부서번호가 없는 사원의 정보 조회하기
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL; 
 
 -- 8. 사원테이블에서 커미션을 받는 사원의 정보 조회하기 
SELECT *
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
SELECT * FROM EMPLOYEES;

-- 9. 사원테이블에서 전화번호가 '515'로 시작하는 사원의 정보 조회하기 
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515' || '%' ; -- % 가 들어가면 등호대신에 LIKE 사용해야한다. || ->연결하기 - 앞부분에 사용자가 입력한 문자등이 들어가게 하기 위해서 씀
 
 -- 10. 사원테이블에서 전화번호가 '515'로 시작하는 전화번호를 조회/중복제거
SELECT DISTINCT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515' || '%';
 
 --11. 사원테이블의 사원들을 연봉순으로 높은 연봉을 먼저 조회하기 
SELECT *
  FROM EMPLOYEES
 ORDER BY SALARY DESC;  --오름차순(기본)-ASC (ASCENDING) 내림차순-DESC(DESCENDING)
 
 --12.사원테이블의 사원들을 입사순으로 조회하시오
 SELECT *
   FROM EMPLOYEES
  ORDER BY HIRE_DATE ASC; --ASC 생략가능

-- 13.사원테이블의 사원들을 부서별로 비교할 수 있도록 같은 부서의 사원들을 모아서 조회한 뒤 
-- 같은 부서내의 사원들은 연봉순으로 조회하기 높은순으로 
SELECT * 
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID ,SALARY DESC;  -- , 는 각각 끊어서 봐야한다. -- 5,6 차 정렬까지 흔히 나온다. 
          