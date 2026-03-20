create database supply_chain
go
use supply_chain
go

create table suppliers
(
	sid int not null primary key,
	name varchar(30) not null,
	city varchar(20) null
)

create table parts
(
	part_id int not null primary key,
	part_name varchar(30) not null,
	color varchar(10) null,
	weight decimal(6,3) null
)

create table suppliers_parts
(
	sid int not null,
	part_id int not null,
	quantity int not null,
	foreign key (sid)
	references suppliers(sid),
	foreign key (part_id)
	references parts(part_id)
)

insert into suppliers(sid,name,city)
values('01','Dell','Plovdiv'),
		('02','LG','Sofiq'),
		('03','SA','Veliko Turnowo')

insert into parts(part_id,part_name,color,weight)
values('1','SSD','black','20'),
		('2','LCD screen','black','450'),
		('3','mouse','white','150')

insert into suppliers_parts(sid,part_id,quantity)
values('02','2','6'),
		('01','1','14'),
		('03','3','4')

delete from suppliers_parts
where part_id in (select part_id from parts where weight < 50)

delete from parts
where weight < '50'

select part_name,color
from parts

insert into parts(part_id,part_name,color,weight)
values('4','chargers','black','70')

insert into suppliers_parts(sid,part_id,quantity)
values('01','4','120')

select distinct p.part_name
from parts p
join suppliers_parts sp on p.part_id = sp.part_id
where sp.quantity > 100