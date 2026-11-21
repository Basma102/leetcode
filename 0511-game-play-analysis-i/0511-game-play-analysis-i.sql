# Write your MySQL query statement below
with first_login as (
    select  player_id,
            device_id,
            event_date as first_login,
            dense_rank() over (partition by player_id order by event_date asc ) as rk  
    from Activity
) 
select  player_id,
       first_login
from  first_login
where rk=1     