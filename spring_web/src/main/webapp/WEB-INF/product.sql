select * from product;

create table product(
pidx int unsigned not null auto_increment,   //자동증가값
pnm varchar(100) not null,		//상품명
pcode varchar(10) not null,		//상품코드
pcost smallint unsigned not null default '0',	//원가
psale smallint unsigned not null default '0',	//판매가
pdis tinyint unsigned not null default '0',		//할인율
pea smallint unsigned not null default '0',		//재고수량
pcontent text null,		//상품내용
puse enum('Y','N') not null default 'Y',	//출력 유/무
pdate timestamp not null default current_timestamp,	//등록일
primary key(pidx),
unique aa(pcode)
);