--지우기 
DROP TABLE SCHEDULE_TBL;
DROP TABLE PLAYER_TBL;
DROP TABLE EVENT_TBL;
DROP TABLE NATION_TBL;

--국가 테이블 만들기 
CREATE TABLE NATION_TBL(
    N_CODE          NUMBER(3)         NOT NULL,   --NUMBER(3) : 0~999  
    N_NAME          VARCHAR2(30 BYTE) NOT NULL,
    N_PARTY_PERSON  NUMBER            CHECK(N_PARTY_PERSON = 0),
    N_PARTY_EVENT   NUMBER,
    N_RPEV_RANK     NUMBER,
    N_CURR_RANK     NUMBER
);

--종목 테이블 만들기 
CREATE TABLE EVENT_TBL(
    E_CODE       NUMBER            NOT NULL,
    E_NAME       VARCHAR2(30 BYTE) NOT NULL,
    E_FIRST_YEAR NUMBER(4),                     --NUMBER(4) : 0~9999
    E_INFO       VARCHAR2(100 BYTE)
);    

--선수테이블
CREATE TABLE PLAYER_TBL(
    P_CODE NUMBER(3)         NOT NULL,
    P_NAME VARCHAR2(30 BYTE) NOT NULL,
    N_CODE NUMBER(3)         NOT NULL,
    E_CODE NUMBER            NOT NULL,
    P_RANK NUMBER,
    P_AGE  NUMBER(3)
);

--일정테이블
CREATE TABLE SCHEDULE_TBL(
    S_NO         NUMBER (3)   NOT NULL,
    N_CODE       NUMBER (3),
    E_CODE       NUMBER,
    S_START_DATE DATE,
    S_END_DATE   DATE,
    S_INFO       VARCHAR2(100 BYTE)
);

--국가 PK
ALTER TABLE NATION_TBL ADD CONSTRAINT PK_NAT PRIMARY KEY(N_CODE);
 
--종목 PK
ALTER TABLE EVENT_TBL ADD CONSTRAINT PK_EVE PRIMARY KEY(E_CODE);

--선수 PK,FK
ALTER TABLE PLAYER_TBL ADD CONSTRAINT PK_PL     PRIMARY KEY(P_CODE);
ALTER TABLE PLAYER_TBL ADD CONSTRAINT FK_NAT_PL FOREIGN KEY(N_CODE) REFERENCES NATION_TBL(N_CODE) ON DELETE CASCADE;  -- PLAYER_TBL의 N_CODE가 NOT NULL이므로, ON DELETE SET NULL이 불가능하다.
ALTER TABLE PLAYER_TBL ADD CONSTRAINT FK_EVE_PL FOREIGN KEY(E_CODE) REFERENCES EVENT_TBL(E_CODE)  ON DELETE CASCADE;  -- PLAYER_TBL의 E_CODE가 NOT NULL이므로, ON DELETE SET NULL이 불가능하다.

--일정 PK,FK
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT PK_SCHE     PRIMARY KEY(S_NO);
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT FK_NAT_SCHE FOREIGN KEY(N_CODE) REFERENCES NATION_TBL(N_CODE) ON DELETE SET NULL; -- ON DELETE CASCADE도 가능하다.
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT FK_EVE_SCHE FOREIGN KEY(E_CODE) REFERENCES EVENT_TBL(E_CODE)  ON DELETE SET NULL; -- ON DELETE CASCADE도 가능하다.

--국가테이블 기본키를 삭제하기 
--국가 테이블의 기본키를 참조하는 외래키를 먼저 삭제해야한다. 
ALTER TABLE SCHEDULE_TBL DROP CONSTRAINT FK_NAT_SCHE;
ALTER TABLE PLAYER_TBL DROP CONSTRAINT FK_NAT_PL; 
ALTER TABLE NATION_TBL DROP CONSTRAINT PK_NAT;

--선수테이블의 FK_EVENT_PLAYER 외래키 일시 중지하기
ALTER TABLE PLAYER_TBL DISABLE CONSTRAINT FK_EVE_PL;

--선수테이블의 FK_EVENT_PLAYER 외래키 일시 다시 시작하기 
ALTER TABLE PLAYER_TBL ENABLE CONSTRAINT FK_EVE_PL;