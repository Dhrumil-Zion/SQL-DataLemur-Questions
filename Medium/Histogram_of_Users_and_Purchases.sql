with
    cte as (
        SELECT
            max(transaction_date) OVER (
                PARTITION BY
                    user_id
            ) as trns_date,
            user_id
        FROM
            user_transactions
    )

select
    transaction_date,
    user_id,
    COUNT(*)
from
    user_transactions
where
    (transaction_date, user_id) in (select * from cte)
GROUP BY
    transaction_date,
    user_id
ORDER BY
    transaction_date;