--CREATE TABLE "CAFE2"."MEMBER" 
--   (	"ID" VARCHAR2(20 BYTE), 
--	"PW" VARCHAR2(20 BYTE), 
--	"NAME" VARCHAR2(50 BYTE)
--   ) SEGMENT CREATION IMMEDIATE 
--  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS" ;


--    CREATE TABLE "CAFE2"."ORDERS" 
--   (	"ORDER_GROUP_NO" NUMBER(10,0), 
--	"ORDERDATE" DATE, 
--	"ORDERMETHOD" VARCHAR2(20 BYTE), 
--	"PRODUCT_NAME" VARCHAR2(50 BYTE), 
--	"QUANTITY" NUMBER(10,0), 
--	"OUTPUT" NUMBER(1,0) DEFAULT 0
--   ) SEGMENT CREATION IMMEDIATE 
--  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS" ;
--  



--   CREATE SEQUENCE  "CAFE2"."ORDER_GROUP_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


--
--   CREATE SEQUENCE  "CAFE2"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;




--  CREATE TABLE "CAFE2"."BOARD" 
--   (	"ARTICLENO" NUMBER(10,0) NOT NULL ENABLE, 
--	"PARENTNO" NUMBER(10,0) DEFAULT 0 NOT NULL ENABLE, 
--	"TITLE" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
--	"CONTENT" VARCHAR2(4000 BYTE), 
--	"IMAGEFILENAME" VARCHAR2(100 BYTE), 
--	"WRITEDATE" DATE DEFAULT current_timestamp NOT NULL ENABLE, 
--	"ID" VARCHAR2(20 BYTE), 
--	 CONSTRAINT "BOARD_PK" PRIMARY KEY ("ARTICLENO")
--  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS"  ENABLE
--   ) SEGMENT CREATION IMMEDIATE 
--  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
--  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
--  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
--  TABLESPACE "USERS" ;



--
--  CREATE OR REPLACE TRIGGER "CAFE2"."BOARD_TRIGGER" 
--BEFORE INSERT ON BOARD 
--REFERENCING NEW AS NEW
--FOR EACH ROW
--BEGIN
--SELECT BOARD_SEQ.NEXTVAL INTO :NEW.ARTICLENO FROM dual;
--END;




--ALTER TRIGGER "CAFE2"."BOARD_TRIGGER" ENABLE;



--insert into member(id, pw, name) values('a', 'a', '�̻�'); 
--insert into member(id, pw, name) values('b', 'b', 'IceDice');
--insert into board(PARENTNO, TITLE, CONTENT, ID) values('0', '�׽�Ʈ1', '�ǳ���?', 'a');
--insert into board(PARENTNO, TITLE, CONTENT, ID) values('1', '�˴ϴ�', '^^', 'b');



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