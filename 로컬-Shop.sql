--select * from membertbl;
--select * from producttbl;
--select sysdate from dual;
--select to_char(sysdate, 'YYYY/MM/DD HH:MM:SS') "현재 날짜" from dual;
--select to_date('20201231235959', 'YYYYMMDDHH24MISS') "날짜 형식" from dual;

create table usertbl
(userId char(8)  ,
userName nvarchar2(10) not null,
birthYear number(4) default -1 not null,
addr nchar(2) default '서울' not null,
mobile1 char(3) null,
mobile2 char(8) null,
height number(3) default 170  null,
mDate date null
--constraint PK_userTBL_userId primary key (userId)
);

alter table usertbl add constraint PK_userTBL_userId primary key (userId);


create table buytbl
( idNum number(8)  primary key ,
userId char(8) not null ,
prodName nchar(6) not null,
groupName nchar(4) null,
price number(8)  null,
amount number(3) not null
);

alter table buytbl
add constraint FK_userTBL_buyTBL
FOREIGN KEY (aaa)
references usertbl(userId)
on delete cascade;


create sequence idSEQ;

insert into usertbl values('LSG','이승기',default,default,'011','11111111',182,'2008-8-8');
insert into usertbl values('KBS','김범수',1979,'경남','011',null,173,'2012-4-4');
insert into usertbl values('KKH','김경호',1971,'전남','019','33333333',177,'2007-7-7');
insert into usertbl (userID, userName) values ('Kay','김아영');

select * from usertbl;

insert into buytbl values(idSEQ.NEXTVAL, 'JYP', '모니터', '전자', 200, 1);
insert into buytbl values(idSEQ.NEXTVAL, 'KBS', '운동화',NULL, 30,2);
insert into buytbl values(idSEQ.NEXTVAL, 'KBS', '노트북','전자', 1000,1);
insert into buytbl values(idSEQ.NEXTVAL, '이승기', '모니터','전자', 200,1);

select * from user_constraints where owner='shop' and constraint_type='P';

select * from user_constraints where table_name='USERTBL' and constraint_type='P';

drop table usertbl cascade constraints;
drop table buytbl cascade constraints;

create table prodTbl (
prodCode char(3) not null,
prodID char(4) not null,
prodDate date not null,
prodCur char(10) null
);

alter table prodTbl
add constraint pk_prodtbl_prodCode_prodId
primary key (prodCode, prodId);

select * from user_constraints where table_name='PRODTBL' and constraint_type='P';