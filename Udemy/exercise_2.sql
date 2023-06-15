use lakshmi;
Select count(*) from books3;

Select released_year,count(*) as Books_released_this_year
from books3 group by released_year;

Select stock_quantity , count(*) as Total 
from books3 group by stock_quantity;

select sum(stock_quantity) from books3; 
-- ans - 2450

select concat(author_fname , ' ' , author_lname) as author,
avg(released_year)
from books3
group by author;

select concat(author_fname , ' ' , author_lname) as author,
avg(stock_quantity),
sum(stock_quantity) as total_stock
from books3
group by author;


-- longest book
select concat(author_fname , ' ' , author_lname) as author,
pages as Total_pages
from books3
where pages= (select MAX(pages) from books3);

select released_year as year,
count(*) as books,
AVG(pages) as avg_pages
from books3
group by released_year
order by released_year;


