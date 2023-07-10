/* 
    ROWID
    1. 오라클에서 제공하는 가상칼럼(PSUDO COLUMN)이다. 
    2. 어떤 행이 어디에 저장되어 있는지 알고 있는 칼럼값이다. 
    3. 실제 저장된 물리적 저장위치를 확인할 수 있다.
    
*/
--ROWID 사용
SELECT ROWID, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;  --ROWID 번지수 같은 개념으로 알고 있으면 됨
  
--ROWID를 이용한 조회
--1. 오라클에서 가장빠른 조회이다. 
--2. 실제로 사용하기가 불가능하다. 대신 인덱스를 사용한다. 
SELECT *
  FROM EMPLOYEES
 WHERE ROWID = 'AAAR+IAAHAAAADMAAE';

/*
    인덱스
    1. 빠른 조회를 지원하는 데이터베이스 객체이다. 
    2. 어떤 데이터가 로우아이디를 가지고 있는지 알고 있다. 빠르다  
    3. 기본키(PK)와 중복이 없는 칼럼 (UNIQUE)는 자동으로 인덱스가 만들어진다.
    4. 인덱스가 많으면 데이터의 삽입/수정/삭제 시 인덱스도 함께 갱신해야 하기 때문에 전체적인 성능이 떨어질 수 있다.  
    
*/

-- 인덱스를 타는 조회
SELECT *
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 150;
  
-- 인덱스를 안타는 조회 (인덱스 칼럼을 그대로 사용하지 않고 칼럼에 함수를 쓰면 인덱스를 타지 않는다. )
SELECT * 
  FROM EMPLOYEES
 WHERE TO_CHAR(EMPLOYEE_ID) = '150'; 

/*
    데이터사전
    1. 특정 데이터의 정보를 담고 있는 객체이다. 
    2. 시스템카탈로그, 메타데이터라고도 한다. 
    3. 계정 유형별로 관리한다. 
        1) DBA_    --가장많은 정보를 가지고 있다. 
        2) USER_
        3) ALL_
*/


-- 인덱스 정보가 저장되어 있는 데이터사전(이미 만들어져 있는 데이블,메타데이터)
-- DBA_INDEXES, USER_INDEXES, ALL_INDEXES
SELECT * FROM USER_INDEXES;

--인덱스가 설정된 칼럼정보가 저장되어 있는 데이터 사전
--DBA_IND_COLUMNS, USER_IND_COLUMNS, ALL_IND_COLUMNS
SELECT * FROM USER_IND_COLUMNS;
SELECT * FROM USER_IND_COLUMNS
 WHERE TABLE_NAME = 'EMPLOYEES';  --사원테이블만 가지고 있는 인덱스만 볼 수 있음

-- 부서테이블의 부서명(DEPARTMENT_NAME)칼럼에 인덱스 설정하기 
CREATE INDEX DEPT_NAME_IX
    ON DEPARTMENTS(DEPARTMENT_NAME);
    
    
--인덱스 DEPT_NAME_IX 삭제하기 
DROP INDEX DEPT_NAME_IX;


