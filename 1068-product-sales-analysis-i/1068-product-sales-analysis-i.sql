# Write your MySQL query statement below
select p.product_name,pe.year,pe.price
from Sales as pe
inner join Product as p 
on p.product_id=pe.product_id;