create table movie_admin(
midx int unsigned not null auto_increment,
mname varchar(30) not null,
mid varchar(20) not null,
mpw varchar(50) not null,
memail varchar(50) not null,
mtel char(13) not null default '000-0000-0000',
mno char(8) not null default '00000000',
mdate timestamp not null default current_timestamp,
muse enum('Y','N') not null default 'N',
primary key(midx),
unique aa(mid),
unique bb(mtel)
);

desc movie_admin;

