select
    user_id,
    spend,
    transaction_date
from
    (
        SELECT
            *,
            row_number() over (
                PARTITION BY
                    user_id
                ORDER BY
                    transaction_date
            ) as rn
        FROM
            transactions
    ) A
where
    rn = 3;