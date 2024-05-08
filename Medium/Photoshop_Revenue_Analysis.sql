SELECT
    customer_id,
    SUM(
        CASE
            when product != 'Photoshop' then revenue
            ELSE 0
        end
    ) as ans
FROM
    adobe_transactions
WHERE
    customer_id in (
        select
            customer_id
        FROM
            adobe_transactions
        where
            product = 'Photoshop'
    )
GROUP BY
    customer_id
ORDER BY
    customer_id;