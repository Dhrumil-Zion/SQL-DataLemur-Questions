with cte as 
(select payer_id,recipient_id 
from payments
GROUP BY payer_id,recipient_id),

tbl as (
    select payer_id,recipient_id  FROM (
        select * from cte 
        UNION ALL 
        SELECT recipient_id,payer_id FROM cte ) a
    GROUP BY payer_id,recipient_id 
    HAVING COUNT(*) > 1
)

select COUNT(*)/2
from tbl;