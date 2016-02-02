
create table employee (id int not null primary key,name varchar(100),sharding_id int not null);

explain create table employee (id int not null primary key,name varchar(100),sharding_id int not null);

insert into employee(id,name,sharding_id) values(1,'leader us',10000);
insert into employee(id,name,sharding_id) values(2, 'me',10010);
insert into employee(id,name,sharding_id) values(3, 'mycat',10000);
insert into employee(id,name,sharding_id) values(4, 'mydog',10010);


create table company(id int not null primary key,name varchar(100));

 insert into company(id,name) values(1,'hp');
 insert into company(id,name) values(2,'ibm');
 insert into company(id,name) values(3,'oracle');
