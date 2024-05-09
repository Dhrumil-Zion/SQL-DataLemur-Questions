SELECT
    order_date,
    product_type,
    sum(quantity) OVER (
        PARTITION BY
            product_type
        ORDER BY
            order_date
    ) as cumilative_quantities
FROM
    total_trans
ORDER BY
    order_date;