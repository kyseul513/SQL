--webdb 계정에 book 테이블 만들기

create table book(
    book_id number(5),      -- 컬럼명+자료형은 띄어쓰기로 같이 씀     
    title varchar2(50),
    author varchar2(10),
    pub_date date
);  



--------Alter: 테이블 구조 수정하는데 사용.
--pubs 컬럼 추가하기
alter table book add(pubs varchar2(50));

--book테이블의 컬럼 속성 변경하기
alter table book modify(title varchar2(100));       -->varchar2(50)에서 varchar2(100)으로 변경
alter table book rename column title to subject;    --> title 컬럼을 subject로 변경

--컬럼 삭제
alter table book drop(author);



--------Rename: 테이블명 변경
rename book to article;     -->book에서 article로 변경



--------Drop: 테이블 삭제
drop table article;



--------Create: 테이블 만들기
--작가(author) 테이블 만들기
create table author (
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

--책(book) 테이블 만들기
create table book(
    book_id     number(10),
    title       varchar2(100) not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)      --book테이블의 author_id를 foreign key로 사용       --book fk: 관계에 대한 이름
    references author(author_id)                   --author 테이블의 author_id 참조(보통 primary key)
);



--------Insert: 테이블에 데이터 추가
--묵시적 방법: 테이블 생성시 정의된 순서에 따라 값 지정
insert into author
values(1, '박경리', '토지 작가');


--명시적 방법: 순서를 지정할 수 있음.
insert into author(author_id, author_name)
values(2, '이문열');        --1을 넣으면 오류남(위에 박경리 정보를 넣어서)

insert into author(author_name, author_id)      -- 작동o
values('이문열', 2);  

insert into author(author_id, author_desc)      --author_name은 not null값을 가지고 있어 오류 발생.
values(2, '삼국지등등 작가');  

--3. '기안84', '웹툰작가'
insert into author
values(3, '기안84', '웹툰작가');



--------Update: 테이블 정보 수정
update author
set author_name = '김경리',     --ahthor_name의 값을 수정하라
    author_desc = '토지작가'
where author_id = 1;          --author_id가 1인 곳만 (where절이 생략되면 모든 레코드에 수정사항이 적용됨.)

--업데이트 주의 (where절로 조건을 걸지 않으면 전부 다 업데이트됨)
update author
set author_name = '김경리',     
    author_desc = '토지작가';

    

--------Delete: 테이블 정보 삭제(한 줄을 삭제)
delete from author
where author_id = 1;

--삭제 주의 (were절로 조건을 걸지 않으면 전부 다 삭제됨)
delete from author;



--------Sequence: 번호표 같은거..
create sequence seq_author_id
increment by 1      --1씩 값을 올림
start with 1       --1부터 시작
nocache;        -- cashe_size 할당하지 않음.

--sequence 조회
select * from user_sequences;       --*cache_size 20: 숫자가 20번까지 이미 뽑혀있다는 의미. 껐다 키면 21번부터 시작.

--현재 sequence 조회
select seq_author_id.currval        ----이걸로 확인할 경우 숫자가 올라가지 않음.
from dual;

--다음 sequence 조회
select seq_author_id.nextval        --이걸로 확인할 경우 숫자가 올라감.
from dual;

--sequence 삭제
drop sequence seq_author_id;

--sequence 활용
insert into author
values(seq_author_id.nextval, '박경리', '토지 작가');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지 작가');

insert into author
values(seq_author_id.nextval, '강풀', '웹툰작가');

-- *참고: insert의 성공 여부랑 상관 없이 건드리면 무조건 숫자가 오름.



---------------------------------------------------------



--시퀀스 조회
select * from user_sequences;
--시퀀스 삭제
drop sequence seq_author_id;
drop sequence seq_book_id;
--테이블 삭제
drop table book;        --book테이블이 author 테이블의 자료를 사용하고 있어서 먼저 삭제해야 함.
drop table author;




/************************
* 과제
************************/

--------시퀀스 만들기
--author 테이블
create sequence seq_author_id
increment by 1
start with 1
nocache;


--book 테이블
create sequence seq_book_id
increment by 1
start with 1
nocache;



--------테이블 만들기 (+ pk 지정)
--author 테이블 
create table author(
    author_id       number(5),
    author_name     varchar2(50),
    author_desc    varchar2(50),
    primary key(author_id)
);


--book 테이블
create table book(
    book_id     number(10),
    title       varchar2(50),
    pubs        varchar2(50),
    pub_date    varchar2(50),
    author_id   number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);
    


--------데이터 추가
--author 테이블 
insert into author
values (seq_author_id.nextval, '이문열', '경북 영양');

insert into author
values(seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values(seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values(seq_author_id.nextval, '김영하', '알쓸신잡');


--book 테이블 
insert into book
values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

insert into book
values(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04', 5);



--------테이블 조인
select bo.book_id,
       bo.title,
       bo.pubs,
       bo.pub_date,
       bo.author_id,
       au.author_name,
       au.author_desc
from book bo, author au
where bo.author_id = au.author_id;


commit;     --이걸 해야 데이터가 들어감.