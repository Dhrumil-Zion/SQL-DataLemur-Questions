with
    cte as (
        select
            manufacturer,
            drug,
            - sum(total_sales - cogs) as p_and_l
        from
            pharmacy_sales
        group by
            manufacturer,
            drug
        HAVING
            sum(total_sales - cogs) < 0
    )
    
select
    manufacturer,
    count(*) as drung_count,
    sum(p_and_l) as total_loss
from
    cte
GROUP BY
    manufacturer
ORDER BY
    total_loss desc;