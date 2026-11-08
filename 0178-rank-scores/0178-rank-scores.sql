with rank_score as (
    select id,
           score,
           DENSE_RANK() over(order by score desc) as rnk
 from Scores          
)
select score,rnk as rank
from rank_score
