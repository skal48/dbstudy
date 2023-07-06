/*
    SELECT 문의 실행 순서
    SELECT 칼럼        5 
      FROM 테이블      1
     WHRER 조건        2
     GROUP BY 그룹     3
    HAVING 그룹조건    4
     ORDER BY 정렬     6
     
*/

--사원테이블에서 부서별 연봉 평균 조회하시오. 
SELECT DEPARTMENT_ID
     , ROUND(AVG(SALARY), 2)
  FROM EMPLOYEES 
 GROUP BY DEPARTMENT_ID ;
     
--사원테이블에서 부서별 연봉 평균 조회하시오. 부서별 사원수가 2명이상인 부서만 조회하시오 //실행순서를 기억하는 것이 좋음
SELECT DEPARTMENT_ID
     , ROUND(AVG(SALARY), 2)
     , COUNT(*)
  FROM EMPLOYEES 
 GROUP BY DEPARTMENT_ID 
HAVING COUNT(*) >= 2
 ORDER BY DEPARTMENT_ID;

