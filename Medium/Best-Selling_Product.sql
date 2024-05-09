WITH
    cte as (
        SELECT
            p.category_name,
            p.product_name,
            ps.sales_quantity,
            ps.rating,
            dense_rank() OVER (
                PARTITION BY
                    p.category_name
                ORDER BY
                    ps.sales_quantity DESC,
                    ps.rating DESC
            ) as rn
        FROM
            products p
            inner join product_sales ps on p.product_id = ps.product_id
    )
    
SELECT
    category_name,
    product_name
from
    cte
where
    rn = 1;