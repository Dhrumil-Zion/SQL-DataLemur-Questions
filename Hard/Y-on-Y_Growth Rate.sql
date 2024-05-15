with
    cte as (
        SELECT
            date_part ('year', transaction_date) as year,
            product_id,
            spend as cur_year_spend,
            lag (spend, 1) OVER (
                PARTITION BY
                    product_id
                ORDER BY
                    date_part ('year', transaction_date)
            ) as prev_spend
        FROM
            user_transactions
    )
    
select
    year,
    product_id,
    cur_year_spend,
    prev_spend,
    ROUND(
        (cur_year_spend - prev_spend) * 100.0 / prev_spend,
        2
    ) as yoy
from
    cte;