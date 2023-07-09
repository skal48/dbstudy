-- ���̺� ����
DROP TABLE BUY_T;
DROP TABLE PRODUCT_T;
DROP TABLE USER_T;

-- ����� ���̺�
CREATE TABLE USER_T (
    USER_NO      NUMBER             NOT NULL         -- ����ڹ�ȣ(�⺻Ű)
  , USER_ID      VARCHAR2(20 BYTE)  NOT NULL UNIQUE  -- ����ھ��̵�
  , USER_NAME    VARCHAR2(20 BYTE)  NULL             -- ����ڸ�
  , USER_YEAR    NUMBER(4)          NULL             -- �¾�⵵
  , USER_ADDR    VARCHAR2(100 BYTE) NULL             -- �ּ�
  , USER_MOBILE1 VARCHAR2(3 BYTE)   NULL             -- ����ó1(010, 011 ��)
  , USER_MOBILE2 VARCHAR2(8 BYTE)   NULL             -- ����ó2(12345678, 11111111 ��)
  , USER_REGDATE DATE               NULL             -- �����
  , CONSTRAINT PK_USER PRIMARY KEY(USER_NO)
);

-- ��ǰ ���̺�
CREATE TABLE PRODUCT_T (
    PROD_CODE     NUMBER            NOT NULL
  , PROD_NAME     VARCHAR2(20 BYTE) NULL
  , PROD_CATEGORY VARCHAR2(20 BYTE) NULL
  , PROD_PRICE    NUMBER            NULL
  , CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_CODE)
);

-- ���� ���̺�
CREATE TABLE BUY_T (
    BUY_NO     NUMBER NOT NULL
  , USER_NO    NUMBER NULL
  , PROD_CODE  NUMBER NULL
  , BUY_AMOUNT NUMBER NULL
  , CONSTRAINT PK_BUY PRIMARY KEY(BUY_NO)
  , CONSTRAINT FK_USER_BUY    FOREIGN KEY(USER_NO)   REFERENCES USER_T(USER_NO)
  , CONSTRAINT FK_PRODUCT_BUY FOREIGN KEY(PROD_CODE) REFERENCES PRODUCT_T(PROD_CODE) ON DELETE SET NULL
);

-- ����� ������
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ ORDER;

-- ��ǰ ������
DROP SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE PRODUCT_SEQ ORDER;

-- ���� ������
DROP SEQUENCE BUY_SEQ;
CREATE SEQUENCE BUY_SEQ ORDER;

-- ����� ���̺� ������
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'YJS', '���缮', 1972, '����', '010', '11111111', '08/08/08');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KHD', '��ȣ��', 1970, '���', '011', '22222222', '07/07/07');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KKJ', '�豹��', 1965, '����', '010', '33333333', '09/09/09');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KYM', '��븸', 1967, '����', '010', '44444444', '15/05/05');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KJD', '������', 1974, '�泲', NULL, NULL, '13/03/03');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'NHS', '����', 1971, '�泲', '010', '55555555', '14/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'SDY', '�ŵ���', 1971, '���', NULL, NULL, '08/10/10');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LHJ', '������', 1972, '���', '011', '66666666', '06/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LKK', '�̰��', 1960, '�泲', '011', '77777777', '04/12/12');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'PSH', '�ڼ�ȫ', 1970, '����', '010', '88888888', '12/05/05');

-- ��ǰ ���̺� ������
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�ȭ', '�Ź�', 30);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, 'û����', '�Ƿ�', 50);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, 'å', '��ȭ', 15);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '��Ʈ��', '����', 1000);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�����', '����', 200);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�޸�', '����', 80);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '��Ʈ', '��ȭ', 30);

-- ���� ���̺� ������
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 1, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 4, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 4, 5, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 5, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 2, 3);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 6, 10);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 5, 3, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 3, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 2, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 1, 2);

COMMIT;


/****************************** �� �� ****************************************/

-- 1. ����ó1�� ���� ������� ����ڹ�ȣ, ���̵�, ����ó1, ����ó2�� ��ȸ�Ͻÿ�.
SELECT USER_NO
     , USER_ID
     , USER_MOBILE1
     , USER_MOBILE2
  FROM USER_T
 WHERE USER_MOBILE1 IN NULL;



-- 2. ����ó2�� '5'�� �����ϴ� ������� ����ڹ�ȣ, ���̵�, ����ó1, ����ó2�� ��ȸ�Ͻÿ�.
SELECT USER_NO
     , USER_ID
     , USER_MOBILE1
     , USER_MOBILE2
  FROM USER_T
 WHERE SUBSTR(USER_MOBILE2,1,1) = 5;

-- 3. 2010�� ���Ŀ� ������ ������� ����ڹ�ȣ, ���̵�, �������� ��ȸ�Ͻÿ�.
SELECT USER_NO
     , USER_ID
     , USER_REGDATE
  FROM USER_T
 WHERE TO_CHAR(USER_REGDATE, 'YYYY') > '2010';

-- 4. ����ڹ�ȣ�� ����ó1, ����ó2�� �����Ͽ� ��ȸ�Ͻÿ�. ����ó�� ���� ��� NULL ��� 'None'���� ��ȸ�Ͻÿ�.
SELECT USER_NO
     , NVL(USER_MOBILE1 || USER_MOBILE2, 'None') AS USER_PHONE
 FROM USER_T;
     

-- 5. ������ ����ڼ��� ��ȸ�Ͻÿ�.
SELECT USER_ADDR AS �ּ�
     , COUNT(*) AS ����ڼ�
  FROM USER_T
 GROUP BY USER_ADDR;



-- �ּ�   ����ڼ�
-- ���   1
-- �泲   2
-- ����   4
-- ���   2
-- �泲   1


-- 6. '����', '���'�� ������ ������ ����ڼ��� ��ȸ�Ͻÿ�.
SELECT USER_ADDR AS �ּ�
     , COUNT(*) AS ����ڼ�
  FROM USER_T
 WHERE USER_ADDR NOT IN('����', '���')
GROUP BY USER_ADDR;


-- �ּ�   ����ڼ�
-- ���   1
-- �泲   2
-- �泲   1


-- 7. ���ų����� ���� ����ڸ� ��ȸ�Ͻÿ�.
SELECT U.USER_NO AS ��ȣ
     , U.USER_ID AS ���̵�
 FROM USER_T U LEFT OUTER JOIN BUY_T B
   ON U.USER_NO = B.USER_NO
WHERE BUY_NO IS NULL;


-- ��ȣ  ���̵�
-- 6     HNS
-- 1     YJS
-- 7     SDY
-- 3     KKJ
-- 9     LKK


-- 8. ī�װ��� ����Ƚ���� ��ȸ�Ͻÿ�.
SELECT P.PROD_CATEGORY AS ī�װ�
     , COUNT(B.BUY_NO) AS ����Ƚ��
  FROM PRODUCT_T P INNER JOIN BUY_T B
    ON P.PROD_CODE = B.PROD_CODE
 GROUP BY P.PROD_CATEGORY;
-- ī�װ�  ����Ƚ��
-- ����      4
-- �Ź�      2
-- ��ȭ      2
-- �Ƿ�      2


-- 9. ���̵� ����Ƚ���� ��ȸ�Ͻÿ�.
SELECT USER_ID AS ���̵�
     , COUNT(BUY_NO) AS ����Ƚ��
  FROM BUY_T B INNER JOIN USER_T U
    ON B.USER_NO = U.USER_NO
 GROUP BY USER_ID;
  
-- ���̵�  ����Ƚ��
-- KHD     3
-- LHJ     2
-- KYM     1
-- KJD     1
-- PSH     3


-- 10. ���̵� ����Ƚ���� ��ȸ�Ͻÿ�. ���� �̷��� ���� ��� ����Ƚ���� 0���� ��ȸ�ϰ� ���̵��� ������������ ��ȸ�Ͻÿ�. ***
SELECT USER_ID AS ���̵�
     , USER_NAME AS ����
     , NVL(COUNT(BUY_NO),0 ) AS ����Ƚ��
     FROM BUY_T B RIGHT OUTER JOIN USER_T U
    ON B.USER_NO = U.USER_NO
GROUP BY USER_ID, USER_NAME, BUY_NO
    HAVING USER_ID = USER_ID
 ORDER BY USER_ID;

AS ����Ƚ�� 

BUY_T B RIGHT OUTER JOIN USER_T U
    ON B.USER_NO = U.USER_NO
 GROUP BY U.USER_ID, U.USER_NAME,B.BUY_NO
 ORDER BY USER_ID;
-- ���̵�  ����  ����Ƚ��
-- KHD     ��ȣ��  3
-- KJD     ������  1
-- KKJ     �豹��  0
-- KYM     ��븸  1
-- LHJ     ������  2
-- LKK     �̰��  0
-- NHS     ����  0
-- PSH     �ڼ�ȫ  3
-- SDY     �ŵ���  0
-- YJS     ���缮  0


-- 11. ī�װ��� '����'�� ��ǰ�� ������ ���� ���ų����� ��ȸ�Ͻÿ�.

SELECT USER_NAME AS ����
     , PROD_NAME AS ��ǰ��
     , (PROD_PRICE * BUY_AMOUNT) AS ���ž�
  FROM BUY_T B INNER JOIN PRODUCT_T P 
    ON B.PROD_CODE = P.PROD_CODE
               INNER JOIN USER_T U
    ON B.USER_NO = U.USER_NO
 WHERE PROD_CATEGORY = '����';
 
-- ����  ��ǰ��  ���ž�
-- ��ȣ��  ��Ʈ��  1000
-- ��븸  �����  200
-- �ڼ�ȫ  �����  1000
-- �ڼ�ȫ  �޸�  800


-- 12. ��� ��ǰ�� ��ǰ��� �Ǹ�Ƚ���� ��ȸ�Ͻÿ�. �Ǹ� �̷��� ���� ��ǰ�� 0���� ��ȸ�Ͻÿ�.
SELECT PROD_NAME AS ��ǰ��
     ,  NVL(CTN,0) AS �Ǹ�Ƚ��
    FROM (SELECT COUNT(BUY_AMOUNT) AS CTN, PROD_NAME 
                FROM BUY_T B RIGHT OUTER JOIN PRODUCT_T P 
                                     ON B.PROD_CODE = P.PROD_CODE GROUP BY PROD_NAME);
    
    
    
-- ��ǰ��  �Ǹ�Ƚ��
-- �޸�  1��
-- �ȭ  2��
-- û����  2��
-- ��Ʈ��  1��
-- �����  2��
-- å      1��
-- ��Ʈ    0��


-- 13. ��ǰ�� ������ �̷��� �ִ� ���� ���̵�, ����, ����Ƚ��, �ѱ��ž��� ��ȸ�Ͻÿ�.
SELECT USER_ID
     , USER_NAME
     , BN
     , AMO
 FROM (SELECT USER_ID, USER_NAME, COUNT(BUY_NO) AS BN, SUM(BUY_AMOUNT * PROD_PRICE) AS AMO
         FROM BUY_T B INNER JOIN USER_T U
           ON B.USER_NO = U.USER_NO LEFT OUTER JOIN PRODUCT_T P ON B.PROD_CODE = P.PROD_CODE
           GROUP BY USER_ID, USER_NAME);
        


-- ���̵�  ����  ����Ƚ��  �ѱ��ž�
-- PSH     �ڼ�ȫ  3         1860
-- KYM     ��븸  1         200
-- KJD     ������  1         75
-- LHJ     ������  2         80
-- KHD     ��ȣ��  3         1210


-- 14. ����Ƚ���� 2ȸ �̻��� ����� ����Ƚ���� ��ȸ�Ͻÿ�.
SELECT USER_NAME AS ����
     , BN
  FROM (SELECT USER_NAME 
             , COUNT(BUY_NO) AS BN
                FROM BUY_T B INNER JOIN USER_T U
                  ON B.USER_NO = U.USER_NO 
               GROUP BY USER_NAME)
 WHERE BN >= 2
 ORDER BY ����;
            
-- ����  ����Ƚ��
-- ������  2
-- �ڼ�ȫ  3
-- ��ȣ��  3


-- 15. � ���� � ��ǰ�� �����ߴ��� ��ȸ�Ͻÿ�. ���� �̷��� ���� ���� ��ȸ�ϰ� ���̵�� �������� �����Ͻÿ�.
SELECT USER_NAME AS ����
     , PN AS ������ǰ
 FROM (SELECT USER_NAME
            , NVL(PROD_NAME,'NULL') AS PN
            , U.USER_ID
         FROM BUY_T B LEFT OUTER JOIN PRODUCT_T P 
           ON B.PROD_CODE = P.PROD_CODE RIGHT OUTER JOIN USER_T U
           ON B.USER_NO = U.USER_NO
        GROUP BY U.USER_ID, USER_NAME,NVL(PROD_NAME,'NULL')
        ORDER BY USER_ID);
            

-- ����   ������ǰ
-- ��ȣ��   �ȭ
-- ��ȣ��   û����
-- ��ȣ��   ��Ʈ��
-- ������   å
-- �豹��   NULL
-- ��븸   �����
-- ������   û����
-- ������   å
-- �̰��   NULL
-- ����   NULL
-- �ڼ�ȫ   �����
-- �ڼ�ȫ   �ȭ
-- �ڼ�ȫ   �޸�
-- �ŵ���   NULL
-- ���缮   NULL


-- 16. ��ǰ ���̺��� ��ǰ���� 'å'�� ��ǰ�� ī�װ��� '����'���� �����Ͻÿ�.
SELECT REPLACE(PROD_NAME, 'å', '����') 
  FROM PRODUCT_T;
 

-- 17. ����ó1�� '011'�� ������� ����ó1�� ��� '010'���� �����Ͻÿ�.
SELECT REPLACE(USER_MOBILE1, '011', '010')
     , USER_MOBILE2
  FROM USER_T;
  
-- 18. ���Ź�ȣ�� ���� ū ���ų����� �����Ͻÿ�.
DELETE
  FROM BUY_T
 WHERE BUY_NO = (SELECT MAX(BUY_NO) FROM BUY_T);
 


-- 19. ��ǰ�ڵ尡 1�� ��ǰ�� �����Ͻÿ�. ���� ���� ��ǰ��ȣ�� 1�� ��ǰ�� ���ų����� ��� ���ϴ��� ��ȸ�Ͻÿ�.
DELETE 
  FROM PRODUCT_T
 WHERE PROD_CODE = 1;

--NULL �� ���Ѵ�. 

-- 20. ����ڹ�ȣ�� 5�� ����ڸ� �����Ͻÿ�. ����ڹ�ȣ�� 5�� ������� ���� ������ ���� ������ �� �����Ͻÿ�.
DELETE 
          FROM BUY_T
         WHERE USER_NO = 5;


DELETE 
  FROM USER_T
 WHERE USER_NO = 5;