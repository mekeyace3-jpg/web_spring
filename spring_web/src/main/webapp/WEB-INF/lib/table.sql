insert into movie_admin values ('0','최고관리자','admin','a123456','admin@test.com','010-1234-5678','00000000',now(),'Y');

select * from movie_admin;

select      * from movie_admin      order midx desc limit 0, 5;

update movie_admin set mpw='895b317c76b8e54c2fb32dbb442178f6ce321' where mid='admin';

select * from notice;

update notice set nsubject='배송지연 안내!!' where nidx='3';
update notice set nsubject='품절 상품 재입고 관련 안내' where nidx='4';


create table notice(
nidx int unsigned not null auto_increment,
nsubject varchar(100) not null,
nwriter varchar(50) not null,
nemail varchar(80) not null,
ncontent text not null,
nfile text null,
npass varchar(50) not null,
ncount int unsigned not null default '1',
ndate timestamp not null default current_timestamp,
primary key(nidx)
)
