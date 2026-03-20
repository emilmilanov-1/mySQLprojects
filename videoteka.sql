create database videoteka
go 
use videoteka
go

create table clients
(
	client_id int not null primary key,
	fname varchar(15) not null,
	lname varchar(15) not null,
	address varchar(50) null
)

create table media
(
	media_id int not null primary key,
	title varchar(30) not null,
	created datetime not null
)

create table clientsmedia
(
	client_id int not null,
	media_id int not null,
	deterent datetime not null,
	price decimal(6,2) null
	foreign key(client_id)
	references clients(client_id),
	foreign key(media_id)
	references media(media_id)
)

insert into clients(client_id,fname,lname,address)
values ('01','Ivan','Draganov','ul.Osvobozhdenie'),
		('02','Stoyan','Lalov','bul.Opulchenski'),
		('03','Diana','Ivanova','ul.Kiril i Metodii')

insert into media(media_id,title,created)
values('001','Truth or Dare','2025-02-18'),
		('002','The Notebook','2018-09-11'),
		('003','The Shining','2008-11-25')

insert into clientsmedia(client_id,media_id,deterent,price)
values('02','003','2025-04-14','9'),
		('01','002','2025-07-12','6'),
		('03','001','2025-12-14','12')

insert into clients(client_id,fname,lname,address)
values('46','Elena','Stoycheva','zh.k.Trakiya, Plovdiv')

select * from clients

update clients
set address = 'Asenovgrad'
where client_id = 46

select * from clients

select fname,lname
from clients

select m.title
from media m
join clientsmedia cm on m.media_id = cm.media_id
where cm.price > 5