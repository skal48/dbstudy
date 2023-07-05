-- 1. 대소문자 변환하기 
SELECT UPPER(EMAIL) --모두 대문자
     , LOWER(EMAIL) -- 모두 소문자
     , INITCAP(EMAIL) --첫 글자만 대문자, 나머지는 소문자
  FROM EMPLOYEES;
  
--2. 글자 수 
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 3. 바이트 수 
SELECT FIRST_NAME
     , LENGTHB(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 4. 연결하기 
--      1) ||연산자 (오라클 전용이므로 다른 DB에서는 오류가 발생한다.)
--      2) CONCAT(CONATENATE)
--         CONCAT(A,B) : 인수를 2개만 전달할 수 있다. 
--         CONCAT(CONCAT(A, B), C) : 인수 3개 이상은 CONCAT 함수 여러개로 해결한다. 
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE CONCAT('515','%');
 
SELECT * 
  FROM EMPLOYEES 
 WHERE EMAIL LIKE CONCAT(CONCAT('%', 'A'), '%');  --A를 포함('%' || 'A' || '%')
 
 -- 5. 일부만 반환하기
SELECT SUBSTR(PHONE_NUMBER, 1, 3)  --전화번호 1 번째 글자부터 3글자를 반환
     , SUBSTR(PHONE_NUMBER, 5) --끝까지 반환
  FROM EMPLOYEES; 
  
-- 6.특정 문자위 위치 반환하기
-- 찾은 문자의 위치 1부터 시작한다. 못찾으면 0을 반환한다. 
SELECT EMAIL
     , INSTR(EMAIL, 'A')
  FROM EMPLOYEES;
  
-- 7. 바꾸기
SELECT EMAIL
     , REPLACE(EMAIL, 'A', '$')  --모든 A를 찾아서 $로 바꾸기
  FROM EMPLOYEES;
  
-- 8. 채우기
--  1)LPAD(표현식, 전체폭, 채울문자) - 왼쪽에 채워라 
--  2)RPAD(표현식, 전체폭, 채울문자) - 오른쪽에 채워라 
SELECT DEPARTMENT_ID
     , LPAD(DEPARTMENT_ID, 3, 0)
  FROM EMPLOYEES;
  
SELECT EMAIL
     , RPAD(SUBSTR(EMAIL, 1, 2), 5, '*')
  FROM EMPLOYEES;
  
-- 9 .공백제거
SELECT '[' || LTRIM('        HELLO         WORLD       ') || ']' -- 왼쪽 공백 제거 
     , '[' || RTRIM('        HELLO         WORLD       ') || ']' --오른쪽 공백 제거
     , '[' || TRIM('        HELLO         WORLD       ') || ']' -- 양뽁 공백 제거 
  FROM EMPLOYEES;
  
-- 실습.
-- 1. 사원테이블의 JOB_ID에서 밑줄(_)앞/뒷부분만 조회하기
/* 
    예시) IT_PROG  -> IT / PROG
        글자수     : 7
        밑줄위치   : 3
        밑줄 앞 글자수 : 2(밑줄 위치 -1)
        밑줄 뒤 글자수 : 4(글자수  - 밑줄위치) 
*/
        
SELECT JOB_ID
     , SUBSTR(JOB_ID, 1, INSTR(JOB_ID, '_') -1)
     , SUBSTR(JOB_ID, INSTR(JOB_ID, '_') + 1, LENGTH(JOB_ID) - INSTR(JOB_ID, '-'))  -- x - 3
     , SUBSTR(JOB_ID, INSTR(JOB_ID, '_') + 1)
  FROM EMPLOYEES;        

SELECT JOB_ID
     , SUBSTR(JOB_ID, 1, 2) || '/' || SUBSTR(JOB_ID, 4)
  FROM EMPLOYEES;
  

SELECT JOB_ID
     ,REPLACE(JOB_ID, '_', '/')
  FROM EMPLOYEES;
     
-- 2. FRIST_NAME 과 LAST_NAME을 대분자로 변환하여 FULL_NAME으로 조회하기 
SELECT FIRST_NAME, LAST_NAME
     , UPPER(CONCAT(CONCAT(FIRST_NAME, ' '),LAST_NAME)) AS FULL_NAME 
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID;
  

  