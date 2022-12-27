DROP table unique_test;


create table notice (
id        number, 				/*PK*/
title     varchar2(300), 		/*제목*/
content   varchar2(4000), 		/*내용*/
writer    varchar2(50),			/*작성자의 id*/
writedate date default sysdate, /*작성일자*/
readcnt   number default 0,     /*조회수*/
root      number,               /*답글 : 원글의 root*/
step      number,               /*글 보일 순서 */
indent    number,               /*들여쓰기*/
constraint notice_id_pk primary key(id),
constraint notice_writer_fk foreign key(writer) references member(userid) -- member의 name으로 해야함!
);

create table member (
    userid  varchar2(100) PRIMARY KEY,
    userpw  varchar2(300),
    name    varchar2(50),
    admin   varchar2(20),
    salt    varchar2(300),
    email   varchar2(100),
    phone   varchar2(13),
    gender  varchar2(3),
    birth   date,
    address varchar2(50),
    profile varchar2(500)
);

-- 테이블 수정
alter table notice add(
    root      number,               /*답글 : 원글의 root*/
    step      number default 0,               /* 글 보일 순서 */
    indent    number default 0
);
alter table member modify(gender default '남');
alter table notice modify(title not null, content not null, writer not null);
-- 파일정보 들어갈 컬럼 추가
alter table notice add(filename varchar2(500), filepath varchar2(500));

select id, root, step, indent
from notice
order by id desc;
update notice set root = id;

commit;

-- 공지글 트리거 (id, root 채워주기)
create or replace NONEDITIONABLE trigger trg_notice
    before insert on notice
    for each row
begin
    select seq_notice.nextval into :new.id from dual;
    if( :new.root is null ) then
        select seq_notice.currval into :new.root from dual;
    end if;
end;
/

--암호화 문제로 이렇게 추가하면 로그인 못함!
insert into member (userid, userpw, name, admin, email, gender)
values ('admin', '0000', '관리자', 'Y', 'admin@hanul.com', '남');


create table and_member(
    email   varchar2(100) primary key,
    pw      varchar2(300) not null,
    name    varchar2(100) not null,
    gender  varchar2(3) DEFAULT '남' check (gender IN ('남','여')),
    file_path   varchar2(1000)  -- 사진경로 저장용
);

INSERT INTO and_member
values('admin', '0000', '관리자', '남', null);

delete from and_member;

commit;

select * from and_member;

-- email값이 admin이고 pw값이 0000 일때 로그인되는 쿼리
select  *
from    and_member
where   email = 'admin'
and     pw = '0000';

ALTER TABLE member
ADD social VARCHAR2(3);

ALTER TABLE member
ADD post VARCHAR2(200);

commit;

delete from member where userid = 'admin';

insert into member(userid, userpw, admin, email, gender, name)
values('admin', '0000', 'Y', 'admin@gg.com', '남', '관리자');

update member set
admin = 'Y'
where userid = 'asdkcone';

rollback;

insert into notice (title, content, writer)
select title, content, writer from notice;

-- no라는 컬럼을 만들기 위해 (페이징)
select *
from    (select row_number() over(order by n.id) no, n.*, name
        from notice n left outer join member m on n.writer = m.userid)
where no between 343 and 352
order by no desc;

select userid from member where userid like '%a%';

select * from member where userid like '%a%';



















