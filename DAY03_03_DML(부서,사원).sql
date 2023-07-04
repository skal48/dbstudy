/*
    DML 
    1. Data Manipulation Language
    2. 데이터(행,Row)를 조작(삽입, 수정, 삭제)하는 언어이다. 
    3. 트랜잭션 개상이다.(작업이 완료되면 COMMIT,작업을 취소하려면 ROLLBACK이 필요하다.)
        1) COMMIT : 작업을 저장한다. COMMIT이 완료된 작업은 ROLLBACK으로 취소할 수 없다.
        2) ROLLBACK : 작업을 취소한다. COMMIT 이후 작업을 취소한다. 
    4. 종류
        1) 삽입 : INSERT INTO VALUES
        2) 수정 : UPDATE SET WHERE
        3) 삭제 : DELETE FROM WHERE
*/
--참고
--자격증에서는 DML의 범주를 INSERT,UPDATE,DELETE + SELECT로 보기도 한다. /SELECT가 안들어가는 것이 일반적

DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

--부서테이블
CREATE TABLE DEPARTMENT_T(
    DEPT_NO     NUMBER NOT NULL,
    DEPT_NAME   VARCHAR2(15 BYTE) NOT NULL,
    LOCATION    VARCHAR2(15 BYTE) NOT NULL,
    CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);

--사원테이블 
CREATE TABLE EMPLOYEE_T(
    EMP_NO      NUMBER NOT NULL,
    NAME        VARCHAR2(20 BYTE) NOT NULL,
    DEPART      NUMBER,
    POSITION    VARCHAR2(20 BYTE),
    GENDER      CHAR(2 BYTE),
    HIRE_DATE   DATE,
    SALARY      NUMBER,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_DEPART_EMPLOYEE FOREIGN KEY(DEPART)REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE CASCADE
);
/*
--부서번호를 생성하는 시퀀스 만들기 - AUTO INCREMENT NUMBER
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1 씩증가하는 번호를 만든다. (디폴트)
    START WITH 1    -- 1부터 번호를 만든다. (디폴트)
    NOMAXVALUE      -- 번호의 상한선이 없다. (디폴트)
    NOMINVALUE      -- 번호의 하한선이 없다. (디폴트)
    NOCYCLE         -- 번호 순환이 없다. (디폴트)
    CACHE 20        -- 20개씩 번호를 미리 만들어 둔다. (디폴트) 
    NOORDER         -- 번호를 순서대로 사용하지 않는다. (디폴트) -번호를 순서대로 사용하는 ORDER 옵션으로 바꿔서 시퀀스를 생성한다. 
;
*/

DROP SEQUENCE DEPT_SEQ;

CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO,DEPT_NAME,LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');

COMMIT;

--사원번호를 생성하는 시퀀스
DROP SEQUENCE EMP_SEQ;

CREATE SEQUENCE EMP_SEQ 
    START WITH 1001 
    ORDER;
--사원데이터 입력
INSERT INTO EMPLOYEE_T(EMP_NO,NAME,DEPART,POSITION,GENDER,HIRE_DATE,SALARY) VALUES(EMP_SEQ.NEXTVAL,'구창민',1,'과장','M','95-05-01',5000000); --날짜는 년 월 일 순으로 하이픈(-) 또는 슬래시(/)로 구분 
INSERT INTO EMPLOYEE_T(EMP_NO,NAME,DEPART,POSITION,GENDER,HIRE_DATE,SALARY) VALUES(EMP_SEQ.NEXTVAL,'김민서',1,'사원','M','17-09-01',2500000);
INSERT INTO EMPLOYEE_T(EMP_NO,NAME,DEPART,POSITION,GENDER,HIRE_DATE,SALARY) VALUES(EMP_SEQ.NEXTVAL,'이은영',2,'부장','F','90-09-01',5500000);
INSERT INTO EMPLOYEE_T(EMP_NO,NAME,DEPART,POSITION,GENDER,HIRE_DATE,SALARY) VALUES(EMP_SEQ.NEXTVAL,'한성일',2,'과장','M','93-04-01',5000000);

COMMIT;


/* 수정과정 
     UPDATE 테이블명 
     SET 업데이트할 내용, 업데이트 내용 ,...
     WHERE 조건식 
*/

-- 1. 부서번호가 3인 부서의 지역을 '인천'으로 변경하시오
UPDATE DEPARTMENT_T
   SET LOCATION = '인천'  --SET절의 등호(=)는 대입연산자 -뒤에 있는 것을 앞으로 보내달라는 것
 WHERE DEPT_NO = 3;      -- WHRER 절의 등호(=)는 동등비교연산자

ROLLBACK;

-- 2. 부서번호가 2인 부서의 근무하는 모든 사원들의 연봉을 50만원 인상
UPDATE EMPLOYEE_T
SET SALARY = SALARY + 500000
WHERE DEPART = 2;


--삭제과정
/*\
    DELETE 
      FROM 테이블
     WHERE 조건식
*/
-- 1. 지역이 '인천'인 부서를 삭제 하시오. (인천에 근무하는 사원이 없다. )
DELETE
FROM DEPARTMENT_T
WHERE LOCATION = '인천';
-- 2. 지역이 서울인 부서를 삭제하시오 (서울에  근무하는 사원이 있다. -> ON DELETE SET NULL 옵션에 의해서 부서정보가 NULL값으로 처리된다. )
DELETE
FROM DEPARTMENT_T
WHERE LOCATION = '서울';

 