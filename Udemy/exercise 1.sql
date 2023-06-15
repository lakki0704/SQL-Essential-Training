use lakshmi;
CREATE table employees1(
  emp_id int auto_increment primary key,
  last_name varchar(100),
  first_name varchar(100),
  middle_name varchar(100),
  age int NOT NULL,
  current_status varchar(20) NOT NULL default 'employed'
);

Insert into employees1(first_name,last_name,age, current_status) 
values ('Lakshmi', 'Sathyan', 21, 'Student'),
('Vishwa' , 'Anand' , 45, 'EMployed'),
('Laksh', '', 34);

Insert into employees1(first_name,last_name,age) 
values ('Lakshmi', 'Sathyan', 21);


select * from employees1;
drop table employees;
