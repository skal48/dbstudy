DROP TABLE BB_T;
DROP TABLE AA_T;



CREATE TABLE AA_T(
    NAME NUMBER NOT NULL UNIQUE
    
);



CREATE TABLE BB_T(
    PHONE VARCHAR2(13 BYTE) NOT NULL UNIQUE,
    NAME NUMBER, 
    CONSTRAINT FK_AA_BB FOREIGN KEY(NAME) REFERENCES AA_T(NAME)
);
