select * from product;

create table product(
pidx int unsigned not null auto_increment,
pnm varchar(100) not null,
pcode varchar(10) not null,
pcost smallint unsigned not null default '0',
psale smallint unsigned not null default '0',
pdis tinyint unsigned not null default '0',	
pea smallint unsigned not null default '0',	
pcontent text null,		//상품내용
puse enum('Y','N') not null default 'Y',	
pdate timestamp not null default current_timestamp,
primary key(pidx),
unique aa(pcode)
);