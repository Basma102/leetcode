# Write your MySQL query statement belo
select  e.employee_id,
        e.name,
        count(m.reports_to) as reports_count,
        ROUND(avg(m.age)) as average_age 
from Employees e
join Employees  m
on e.employee_id=m.reports_to 
group by e.employee_id
order by e.employee_id asc
