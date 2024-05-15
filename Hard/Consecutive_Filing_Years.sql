with
    cte as (
        SELECT
            user_id,
            date_part ('year', filing_date) as year,
            CASE
                when product like 'T%' then 'TurboTax'
                when product like 'Q%' then 'QuickBooks'
            end as product
        FROM
            filed_taxes
    ),
    tbl as (
        SELECT
            *,
            year - row_number() OVER (
                PARTITION BY
                    user_id,
                    product
                ORDER BY
                    year
            ) as chk
        from
            cte
    )
    
SELECT DISTINCT
    user_id
from
    tbl
GROUP BY
    user_id,
    product,
    chk
HAVING
    COUNT(*) > 2
ORDER BY
    user_id;