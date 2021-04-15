create Table Board (
    articleNO number(10) primary key,
    parentNO number(10) default 0,
    title varchar2(500) not null,
    content varchar2(4000),
    writedate date default sysdate not null,
    id nchar(20),
    Constraint FK_ID foreign key(id)
    references member(id)
);