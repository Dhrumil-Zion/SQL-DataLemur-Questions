with
    cte as (
        select
            manufacturer,
            drug,
            units_sold,
            dense_rank() OVER (
                PARTITION BY
                    manufacturer
                ORDER BY
                    units_sold desc
            ) aS rn
        from
            pharmacy_sales
    )
    
select
    manufacturer,
    drug
from
    cte
where
    rn <= 2
ORDER BY
    manufacturer;