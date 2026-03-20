use pet_shop;

select * from cats;
update cats set age=14 where name = 'Misty';
select * from cats;

select * from cats where name = 'Misty';

select * from cats;

update cats set  name = 'Jack' where name = 'Jackson';
update cats set breed = 'British Shorthair' where name = 'Ringo';
update cats set age = 12 where breed = 'Maine Coon';

select * from cats;

delete from cats where name = 'Egg';
select * from cats;

delete from cats where age = 4;
select * from cats;

delete from cats where age = cat_id;
select * from cats;

delete from cats;
select * from cats;

create database shirts_db;
use shirts_db;

create table shirts(
	shirt_id int primary key auto_increment,
    article varchar(20) not null,
    color varchar(10) not null,
    shirt_size varchar(10) not null,
    last_worn int not null
);

insert into shirts( article, color, shirt_size, last_worn)
values('t-shirt','white','S', 10),
	('t-shirt','green','S', 200),
	('polo shirt','black','M', 10),
	('tank top','blue','S', 50),
	('t-shirt','pink','S', 0),
	('polo shirt','red','M', 5),
	('tank top','white','S', 200),
	('tank top','blue','M', 15);
    
select * from shirts;

insert into shirts(color,article,shirt_size,last_worn)
values('purple', 'polo shirt', 'M', 50);

select * from shirts;

select article, color from shirts;

select article, color, shirt_size, last_worn from shirts where shirt_size = 'M';

update shirts set shirt_size = 'L' where article = 'polo shirt';
select * from shirts;

update shirts set last_worn = 0 where last_worn = 15;
select * from shirts;

update shirts set shirt_size = 'XS', color = 'off-white' where color = 'white';
select * from shirts;

delete from shirts where last_worn = 200;
select * from shirts;

delete from shirts where article = 'tank top';
select * from shirts;

delete from shirts;

drop table shirts;




