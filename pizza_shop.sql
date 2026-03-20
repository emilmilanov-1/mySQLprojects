create database pizza
go
use pizza
go

create table pizzas
(
	pizza_id int not null primary key,
	pizza_type varchar(20) not null
)

create table clients
(
	client_id int not null primary key,
	name varchar(30) not null,
	phone varchar(10) not null
)

create table pizza_orders
(
	pizza_id int not null,
	client_id int not null,
	quantity int not null,
	size char(1) not null,
	datetme datetime not null,
	foreign key(pizza_id) 
	references pizzas(pizza_id),
	foreign key(client_id) 
	references clients(client_id)
)

alter table pizza_orders
add price decimal(5,2) not null check(price >0)

alter table clients
drop column phone

insert into pizzas(pizza_id, pizza_type)
values('01', 'margarita'),
		('02','fourmagi'),
		('03','peperoni')

insert into clients(client_id,name)
values('001','Ivan Stoychev'),
		('002','Ivaylo Georgiev'),
		('003','Stayko Ivanov')

insert into pizza_orders
(pizza_id, client_id, quantity, size, datetme, price)
values('03', '002', '2', 'M', '20:00', '10.50'),
		('02', '001', '1', 'S', '21:00', '12.20')

select * from pizza_orders

update pizza_orders
set  quantity = 5 ,
	size = 'S'
where pizza_id = 03; 

select * from pizza_orders

delete from pizzas
where pizza_id = 01

select * from pizzas

select c.name, p.datetme
from clients as c
join pizza_orders as p on c.client_id = p.client_id
where p.size = 'S'
order by c.client_id desc

insert into clients(client_id,name)
values ('004','Georgi Proynov')

select * from clients

select c.name, count(p.pizza_id) as total_orders
from clients as c
left join pizza_orders as p on c.client_id = p.client_id
group by c.name

insert into pizza_orders
(pizza_id, client_id, quantity,size,datetme,price)
values('02','004','2','L','23:00','12.20')

select * from pizza_orders

select z.pizza_type, count(p.pizza_id) as total_orders
from pizzas as z
join pizza_orders as p on z.pizza_id = p.pizza_id
group by z.pizza_type
having count (p.pizza_id) > 1

go
create view pizzasummary as
select p.pizza_type, sum(po.quantity) as total_quantity
from pizzas p
join pizza_orders po on p.pizza_id = po.pizza_id
group by p.pizza_type
go