use lakshmi;
create table students 
(
     id int primary key auto_increment,
     first_name varchar(30)
);

create table papers
(
    title varchar(60),
    grade varchar(20),
    student_id int ,
    foreign key(student_id) references students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- q1
select first_name , title, grade 
from students left join papers
ON student_id = id;

-- q2 
select first_name , ifnull(title, 'MISSING'), 
ifnull(grade, 0) 
from students left join papers
ON student_id = id;

-- q3
select first_name , ifnull(avg(grade),0) as average from students 
left join papers ON student_id =id
group by first_name
order by average desc;

-- q4
select first_name , ifnull(avg(grade),0) as average ,
case 
 when avg(grade)>70 then 'PASSING'
 else 'FAILING'
 end as passing_status
from students 
left join papers ON student_id =id
group by first_name
order by average desc;

