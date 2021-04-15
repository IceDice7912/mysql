--CREATE SEQUENCE  board_seq  
--START WITH 1
--INCREMENT BY 1;


--CREATE TABLE BOARD 
--(
--  ARTICLENO NUMBER(10) NOT NULL 
--, PARENTNO NUMBER(10) DEFAULT 0 NOT NULL 
--, TITLE VARCHAR2(500) NOT NULL 
--, CONTENT VARCHAR2(4000) 
--, IMAGEFILENAME VARCHAR2(100) 
--, WRITEDATE DATE DEFAULT sysdate NOT NULL 
--, ID VARCHAR2(20) 
--, CONSTRAINT BOARD_PK PRIMARY KEY 
--  (
--    ARTICLENO 
--  )
--  ENABLE 
--);


--CREATE OR REPLACE TRIGGER BOARD_TRIGGER 
--BEFORE INSERT ON BOARD 
--REFERENCING NEW AS NEW
--FOR EACH ROW
--BEGIN
--SELECT BOARD_SEQ.NEXTVAL INTO :NEW.ARTICLENO FROM dual;
--END;

--ALTER TRIGGER board_trigger ENABLE;

Insert into BOARD (ARTICLENO,PARENTNO,TITLE,CONTENT,IMAGEFILENAME,WRITEDATE,ID) values (1,0,'test1','test1',null,to_date('21/04/07','RR/MM/DD'),'a');
Insert into BOARD (ARTICLENO,PARENTNO,TITLE,CONTENT,IMAGEFILENAME,WRITEDATE,ID) values (2,1,'test1','테스트 성공했나요?',null,to_date('21/04/07','RR/MM/DD'),'a');

select level,
articleNO,
parentNO,
LPAD(' ', 4*(LEVEL-1)) || title title,
content,
writeDate,
imageFileName,
id
from board
start with parentNO=0
connect by prior articleNO=parentNO
order siblings by articleNO desc;

commit;
