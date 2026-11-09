# Write your MySQL query statement below
with jointure as (
    select e.id,
           e.name as Employee ,
           e.salary as Salary ,
           d.name as Department  
    from Employee e
    join Department d
    on e.departmentId=d.id
),
ranked as (
    select Department,
           Employee,
           Salary,
           DENSE_RANK() over(partition by Department order by salary desc) as rnk
    from jointure
)
select Department,
       Employee,
       Salary
from ranked
where rnk<=3 
