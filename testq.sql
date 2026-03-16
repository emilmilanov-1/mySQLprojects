create database new_db;

use new_db;

create table test1(
	value1 int primary key not null , 
    value2 varchar(30) not null, 
    value3 varchar(50));
    
insert into test1(value1, value2, value3)
value(1, 'maimuna','kokoshka');

select * from test1;