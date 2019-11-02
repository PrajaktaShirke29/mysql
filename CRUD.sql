use practiceDb;
create table cat (name varchar(50), age Int(3));

Insert into cat(name, age) values('John', 10);
Insert into cat values('joe', 5);

Insert into cat (name, age) values ('liza', 2), ('contorller', 1), ('corniar', 7);

-- First inseert Challenge
create table people (first_name varchar(20), last_name varchar(20), age Int(2));
Insert into people(first_name, last_name, age) values ('Tina', 'Belcher', 13);
Insert into people(last_name, first_name, age)values ('belcher', 'bob', 10);
Insert into people(first_name, last_name, age) values('Linda', 'Belcher', 45), ('Philip', 'Frond', 38), ('calvin', 'Fischoeder', 70);
select * from people;
select database();
Desc people;
show tables;

show warnings;

-- Primary key and not null and default challenge
Create table employees (id Int auto_increment primary key,  last_name varchar(50) not null, first_name varchar(50) not null, middle_name varchar(50), age int not null, current_status varchar(50) Not Null default 'Employed'); 
desc employees;
select * from employees;
Insert into employees(last_name, first_name, middle_name, age, current_status) values('Labela', 'joe', '',23, '' );
Insert into employees(last_name, first_name, age) values('Labela', 'joe', 23 );
drop table cat;
drop table employees;

-- CRUD operation
Create table cats (cat_id int Not null primary key auto_increment, name varchar(100), breed varchar(100), age int);
			-- Create
Insert into cats(name, breed, age) values('Ringo', 'Tabby', 4), ('Cindy', 'Maine coon', 10), ('Dumbledore', 'Mai e coon', 11), ('Egg', 'Persian', 4), ('Misty', 'Tabby', 13), ('George Michael', 'Ragdoll', 9), ('Jackson', 'Sphyns', 7);
			-- Read
Select * from cats;
Select name, breed, age from cats;
select name, age from cats where age=4;
select * from cats where name='EGG'; -- Case insensitive

-- Select challenge
select cat_id from cats;
select name, breed from cats;
select name, age from cats where breed='tabby';
select cat_id, age from cats where cat_id = age;

-- Aliases (As) 
select cat_id As id, name, breed as 'kitty breed' from cats;

			-- update
update cats set breed='shorthair' where breed = 'Tabby';
update cats set age=14 where name='Misty';

-- Update challenge
update cats set name='Jack' where name='Jackson';
Update cats set breed='British Shorthair' where name='Ringo';
update cats set age=12 where breed='Maine Coon'; 

			-- Delete
Delete from cats where name='egg';

-- delete challenge
select * from cats;
delete from cats where age=4;
delete from cats where age=cat_id;
delete from cats;

drop table cats;
drop database practicedb;
