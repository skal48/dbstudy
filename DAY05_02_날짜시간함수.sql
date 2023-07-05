--1. 현재 날짜 및 시간

--오라클이 설치된 서버 기준 시간
SELECT SYSDATE  --DATE 형식
     , SYSTIMESTAMP  --TIMESTAMP 형식
  FROM DUAL;
  
--새션타임존 기준 시간
SELECT SESSIONTIMEZONE  --해외에 오라클 서버를 두었다면 외국으로 나옴
     , CURRENT_DATE
     , CURRENT_TIMESTAMP
  FROM DUAL;  
  
-- 2. 날짜 원하는 형식으로 조회하기 //TO_DATE -는 원하는 형식으로 날짜를 불러오는 것 
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH24:MI:SS')
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD AM HH24:MI:SS.FF3') -- 밀리초(천분의 1초)포함
  FROM DUAL;
  
-- 3. DATE 형식의 날짜 연산
--   1) 1일을 숫자 1로 처리한다. 
--   2) 1 = 1일, 1/24=1시간, 1/24/60 =1분, 1/24/60/60=1초
SELECT TO_CHAR(SYSDATE + 1, 'YYYY-MM-DD AM HH:MI:SS')  --1일 후
     , TO_CHAR(SYSDATE +1/24, 'YYYY-MM-DD AM HH:MI:SS')  --1시간 후
     , TO_CHAR(SYSDATE + 1/24/60, 'YYYY-MM-DD AM HH:MI:SS')  --1분 후
     , TO_CHAR(SYSDATE + 1/24/60/60, 'YYYY-MM-DD AM HH:MI:SS') --1초 후 
  FROM DUAL;
  
SELECT SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')
     , TRUNC(SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD'))
  FROM DUAL;   --비밀번호 변경일수 계산해서 바꾸라고 하기 
  
-- 4. TIMESTAMP 형식의 날짜 연산
--    1) INTERVAL 키워드를 이용한다. 
--    2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND 단위를 사용한다. 
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR  --1년 후 
     , SYSTIMESTAMP + INTERVAL '1' MONTH --1개월 후 
     , SYSTIMESTAMP + INTERVAL '1' DAY  --1일 후
     , SYSTIMESTAMP + INTERVAL '1' HOUR  --1시간 후 
     , SYSTIMESTAMP + INTERVAL '1' MINUTE  --1분 후
     , SYSTIMESTAMP + INTERVAL '1' SECOND --1초 후 
  FROM DUAL;
  
SELECT SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD') --경과한 기간이 TIMESTAMP 형식으로 반환, DAY 만 추출하려면 별도의 함수가 필요하다. 
     , EXTRACT(DAY FROM SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD')) --경과한 기간에서 일수를 추출
  FROM DUAL;
  
-- 5. 필요한 단위 추출하기 
SELECT EXTRACT(YEAR FROM SYSDATE)  -- 년
     , EXTRACT(MONTH FROM SYSDATE)  -- 월
     , EXTRACT(DAY FROM SYSDATE)   -- 일
     , EXTRACT(HOUR FROM SYSTIMESTAMP)   -- 시, UCT(표준시) 기준
     , EXTRACT(HOUR FROM SYSTIMESTAMP) + 9  -- 시, Asia.Seoul 기준
     , EXTRACT(MINUTE FROM SYSTIMESTAMP) -- 분
     , EXTRACT(SECOND FROM SYSTIMESTAMP) -- 초
     , TRUNC(EXTRACT(SECOND FROM SYSTIMESTAMP))
     , TO_CHAR(SYSDATE, 'YYYY')  -- TO_CHAR 함수를 단위 추출용도로 사용
  FROM DUAL; 
  
-- 6. 요일을 기준으로 특정날짜 구하기.
SELECT NEXT_DAY(SYSDATE, '수')  --요일은 한글로 적을 수 있음. '다음수요일' 
     , NEXT_DAY(SYSDATE-8, '수') ---지난 수요일, 안전하게 -8일로 하자  (-7이 아님에 주의 )
  FROM DUAL;

-- 7. N 개월 전후 날짜 구하기
SELECT ADD_MONTHS(SYSDATE,1)  --1개월 후 
     , ADD_MONTHS(SYSDATE, -1) --1개월 전
     , ADD_MONTHS(SYSDATE, 5 * 12) --5년 후 
  FROM DUAL;

--8. 경과한 개월 수 구하기 
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('23/01/01', 'YY/MM/DD'))
     , TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('23/01/01', 'YY/MM/DD')))
  FROM DUAL;