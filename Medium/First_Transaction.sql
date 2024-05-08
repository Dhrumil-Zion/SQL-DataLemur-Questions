select
    COUNT(DISTINCT user_id)
from
    user_transactions
where
    (user_id, transaction_date) in (
        select
            user_id,
            MIN(transaction_date)
        from
            user_transactions
        GROUP BY
            user_id
    )
    and spend >= 50;