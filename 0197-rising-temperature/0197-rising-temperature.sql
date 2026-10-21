# Write your MySQL query statement below
with numero_date as (
    select  id,
            recordDate,
            temperature,
            COALESCE(temperature-lag(temperature) over(order by recordDate),0) as nm,
            DATEDIFF(recordDate,lag(recordDate) over(order by recordDate)) as dt
from Weather

)
select id
from numero_date 
where nm>0 and dt=1
