with
    cte as (
        select
            *,
            row_number() OVER (
                PARTITION BY
                    user_id
                ORDER BY
                    transaction_date
            ) as rn
        from
            transactions
    ),
    tbl as (
        select
            user_id,
            transaction_date,
            date_part ('day', transaction_date::date) - rn as chk
        from
            cte
        where
            user_id in (
                select
                    user_id
                from
                    cte
                where
                    rn = 3
            )
    )


select
    user_id
from
    tbl
GROUP BY
    user_id,
    chk
HAVING
    COUNT(*) >= 3;


------------ Optimized Solution -----------------
-- SELECT DISTINCT T1.user_id
-- FROM transactions AS T1
-- INNER JOIN transactions AS T2
--   ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
-- INNER JOIN transactions AS T3
--   ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
-- ORDER BY T1.user_id;