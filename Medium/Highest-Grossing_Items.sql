with
    cte as (
        SELECT
            category,
            product,
            sum(spend) as total_spend
        FROM
            product_spend
        where
            date_part ('year', transaction_date) = 2022
        GROUP BY
            category,
            product
    )

select
    category,
    product,
    total_spend
from
    (
        select
            *,
            row_number() over (
                PARTITION BY
                    category
                ORDER BY
                    total_spend desc
            ) as rn
        from
            cte
    ) A
where
    rn <= 2;