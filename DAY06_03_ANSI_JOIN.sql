/*
    JOIN 
    
    1. 두개 이상의 테이블을 한번에 조회하는 방식이다. 
    2. 각 테이블의 관계(1 : M)를 이용하여 조인 조건을 만든다. 
    3. 조인 종류
        1) 내부 조인 : 두개테이블에 모두 존재하는 데이터만 조회한다. 
        2) 외부 조인 : 2개 테이블에 모두 존재하지 않더라도 조회하는 방식
        회원   |   구매
       1    A  | 1 A 새우깡
       2    B  | 2 A 맛동산
       3    C  | 3 B 새우깡
        
    (내부조인)구매내역을 뽑아보자        
        A 새우깡
        A 맛동산
        B 새우깡
        
    (외부조인) 구매내역이 없는 사람도 포함해서 구매내역을 뽑아보자 
        A 새우깡
        A 맛동산
        B 새우깡
        C NULL
    
    
        3) 
    
*/

/*
    드라이브 테이블 VS 드리븐 테이블
    
    1. 드라이브테이블 
        1) 조인 관계를 처리하는 메인테이블
        2) 1 : M 과계에서 1에 해당하는 테이블
        3) 일반적으로 데이터의 갯수가 적다. 
        4) PK에 (인덱스가 들어가 있음)를 조인 조건으로 사용하기 때문에 인덱스(INDEX)사용이 가능하다. (빠르다는 의미)
        
    2. 드리븐테이블
        1) 1 : M 과계에서 M에 해당하는 테이블
        2) 일반적으로 데이터의 갯수가 많다. 
        3) FK를 조인 조건으로 사용하기 때문에 인덱스(INDEX)사용이 불가능하다. (느리다는 의미)
    3. 드라이브 테이블을 드리븐 테이블보다 먼저 작성하면 성능에 도움이 된다. 
*/

-- 내부 조인
-- 1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.

SELECT EMPLOYEE_ID 
     , FIRST_NAME 
     , LAST_NAME
     , D.DEPARTMENT_ID --2개의 테이블에 모두 있는 칼럼(이름이 같은 칼럼)은 반드시 테이블(오너)을 명시해야한다. //데이터의 양이 적은것이 앞에 많은 것이 뒤에도 도움에 좋다. 
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E  --테이블의 작성 순서는 1 : M관계일경우 1을 앞에 두고 M 을 뒤에 두는 것이 도움이 된다. 순서가 어떻게 되어도 답은 같다.
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 2. 사원번호 사원명 직업 연봉 직업별 최대연봉 최소연봉
SELECT EMPLOYEE_ID
     , FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
     , J.JOB_ID
     , SALARY
     , MAX_SALARY
     , MIN_SALARY
  FROM JOBS J INNER JOIN EMPLOYEES E
    ON J.JOB_ID = E.JOB_ID;
    
-- 외부조인

--3, 모든 사원들의 (부서가 없는 사원도 포함) 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT EMPLOYEE_ID 
     , FIRST_NAME 
     , LAST_NAME
     , D.DEPARTMENT_ID  
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E -- 오른쪽 테이블(EMPLOYEES)의 모든 데이터를 조회하시오. (부서번호가 없는 사원도 조회하시오 )
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

--4. 사원번호 사원명 부서번호 부서명을 조회하시오. 사원이 근무하지 않는 유령부서도 조회하시오 .
SELECT EMPLOYEE_ID 
     , FIRST_NAME 
     , LAST_NAME
     , D.DEPARTMENT_ID  
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E  -- 왼쪽 테이블(DEPARTMENTS)의 모든 데이터를 조회하시오. (사원이 근무하지 않는 부서도 조회하시오 )
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 3개 이상 테이블 조인하기 

-- 5. 사원번호 사원명 부서번호 부서명 근무지역을 조회 
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME 
     , L.LOCATION_ID
     , CITY
 FROM LOCATIONS L INNER JOIN DEPARTMENTS D     
   ON L.LOCATION_ID = D.LOCATION_ID INNER JOIN EMPLOYEES E    -- FROM LOCATIONS L INNER JOIN DEPARTMENTS D  ON L.LOCATION_ID = D.LOCATION_ID 까지 하나의 테이블이 완성이 된 것이므로 
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;                      -- 뒤에 이어서 EMPLOYEES 테이블 연결하면 됨
    
    
-- 6.부서번호 부서이름 근무지역(도시) 근무지역(국가) 조회하시오
SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , CITY
     , COUNTRY_NAME
  FROM COUNTRIES C INNER JOIN LOCATIONS L
    ON C.COUNTRY_ID = L.COUNTRY_ID INNER JOIN DEPARTMENTS D
    ON L.LOCATION_ID = D.LOCATION_ID;
