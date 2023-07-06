/*
    GROUP BY 절 
    1. 같은 값을 가진 데이터들을 하나의 그룹으로 묶어서 처리한다. -> 1개의 행으로 묶는다는 것이다. 
    2. 통계를 내는 목적으로 사용한다. (합계, 평균,  최댓값, 최솟값, 갯수 등)
    3. SELECT 절에서 조회하려는 칼럼은 "반드시" GROUP BY 절에 명시되어 있어야 한다. 
*/

-- 1.사원테이블에서 동일한 부서번호 가진 사원들을 그룹화 하여 조회하시오 --> 잘못된 문제
--      사원테이블에서 동일한 부서번호 가진 사원들을 그룹화 하여 "각 그룹별로 몇 명의 사원이 있는지" 조회하시오 
SELECT DEPARTMENT_ID    --어떤 부서가 있는지 알기위해서 적어줌(DEPARTMENT_ID)
     , COUNT(*)         -- GROUP BY 절에서 지정한 칼럼만 조회할 수 있다. 
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- 2. 사원테이블에서 같은 직업을 가진 사원들을 그룹화하여 각 그룹별로 연봉의 평균이 얼마인지 조회하시오 
SELECT JOB_ID
     , ROUND(AVG(SALARY), -2) AS 평균연봉
  FROM EMPLOYEES 
 GROUP BY JOB_ID;
 
-- 3. 사원테이블에서 전화번호 앞 3자리가 같은 사원들을 그룹화하여 각 그룹별로 연봉의 합계가 얼마인지 조회하시오 
 SELECT SUBSTR(PHONE_NUMBER, 1, 3)
      , SUM(SALARY)
   FROM EMPLOYEES
  GROUP BY SUBSTR(PHONE_NUMBER, 1, 3);
    
-- 참고. GROUP BY 절 없이 통계내기 
SELECT DISTINCT(DEPARTMENT_ID)
     , COUNT(*) OVER(PARTITION BY DEPARTMENT_ID)
     , ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID), 2) 
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID;
  
/*
    HAVING 절
    1. GROUP BY 절 이후에 나타난다. 
    2. GROUP BY 절을 이용한 조회 결과에 조건을 지정하는 경우에 사용한다. 
    3. GROUP BY 절이 필요하지 않은 조건은 WHERE 절로 지정한다. 
    
*/

-- 4. 사원테이블에서 각 부서별 사원수가 20명 이상인 부서 
-- 조건 : 부서별 사원수 >= 20
-- 조건에서 사용되는 부서별 사원수는 GROUP BY 절이 필요하므로 HAVING 절로 처리 
SELECT DEPARTMENT_ID
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 5. 사원테이블에서 각 부서별 사원수를 조회하시오 단 부서번호가 없는 사원은 제외하시오 
-- 부서번호 IS NOT NULL
--- 조건에서 사용되는 부서번호는 GROUP BY 절이 필요없으므로 WHERE 절로 처리
SELECT DEPARTMENT_ID 
     , COUNT(*)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID;    -- 그룹화 한 뒤에 제거하는 것보다 미리 제거하고(WHERE 절로 미리 제거) 그룹하는 것이 성능면에서 더 빠르고 좋다.


SELECT DEPARTMENT_ID 
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING DEPARTMENT_ID IS NOT NULL;