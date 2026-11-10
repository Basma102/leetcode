# Write your MySQL query statement beloww
with direct_reports as(
    select e.id,
           e.name as name,
           count(m.managerId) as cnt
    from Employee e
    join Employee m
    on e.id=m.managerId
    group by e.id
)
select name
from direct_reports
where cnt>=5