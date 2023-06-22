use lakshmi;

CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL (8,2),
customer_id INT 
-- foreign key(customer_id) references customers(id)
);

alter table orders
add constraint foreign key(customer_id) references customers(id);

desc orders;

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
('2017-11-11', 35.50, 1),
('2014-12-12', 800.67, 2),
('2015-01-03', 12.50, 2),
('1999-04-11', 450.25, 5);

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 990.99, 1);

-- inner join
select first_name, last_name , sum(amount) 
from customers
join orders on orders.customer_id = customers.id
group by first_name, last_name;

-- left join 
select first_name, last_name , sum(amount) 
from customers
left join orders on orders.customer_id = customers.id
group by first_name, last_name;

-- right join (order -right and customer -left)
select first_name, last_name , sum(amount) 
from customers
right join orders on orders.customer_id = customers.id
group by first_name, last_name;

-- right join (customer -right and order -left)
select first_name, last_name , sum(amount) 
from orders
right join customers on orders.customer_id = customers.id
group by first_name, last_name;


-- left join (introducing IFNULL)
select first_name, last_name , 
ifnull(SUM(amount),0) 
from customers
left join orders on orders.customer_id = customers.id
group by first_name, last_name;

-- alter table orders
-- add constraint foreign key(customer_id) references customers(id) ON delete cascade;

drop table orders;

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL (8,2),
customer_id INT ,
foreign key(customer_id) references customers(id) ON DELETE CASCADE
);

delete from customers where id=1;
select * from orders;

