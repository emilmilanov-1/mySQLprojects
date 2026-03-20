create database car_p;

use car_p;

create table people
(
	person_id int not null primary key,
	name varchar (50) not null
);

create table cars
(
	car_id int not null primary key,
	model varchar (50) not null,
	person_id int,
	foreign key (person_id)
	references people(person_id)
);

 alter table cars
 add mark varchar(40);
 
 
 
 insert into people (person_id,name)
 values('1', 'Ivan Stoyanov' ),
		('2', 'Georgi Petrov'),
		('3', 'Stancho Dimitrov');

insert into cars (car_id, model, person_id,mark)
values('01', 'S Class', '3', 'Mercedes'),
		('02', 'Octavia', '2', 'Skoda'),
		('03', 'Yaris', '1', 'Toyota');

delete from cars 
where car_id = 03;

select * from cars;
		
update people
set name = 'Evgeni Ivanov'
where person_id = '3';

select * from people;

insert into people (person_id, name)
values('4','Rumen Geshev'),
		('5','Nikolay Semkov');

SELECT 
    p.person_id,
    p.name,
    c.car_id,
    c.model,
    c.mark
FROM people AS p
LEFT JOIN cars AS c
    ON p.person_id = c.person_id;

SELECT 
    p.person_id,
    p.name,
    COUNT(c.car_id) AS [car number]
FROM people AS p
LEFT JOIN cars AS c
    ON p.person_id = c.person_id
GROUP BY p.person_id, p.name;
