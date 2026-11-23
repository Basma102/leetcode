with calcul as (
    select *,
           (SELECT COUNT(DISTINCT player_id)
            FROM Activity) AS total
           from Activity
           
),
ranked as(
    select player_id,
           event_date,
           coalesce(datediff(event_date,LAG(event_date) over(partition by player_id order by event_date asc)),0) as after,
           total,
           DENSE_RANK() over(partition by player_id order by event_date asc) as rnk
    from calcul      
)

select coalesce(round(COUNT(DISTINCT player_id)/total,2),0) as fraction
from ranked
where after=1 AND rnk=2 




   
       
 