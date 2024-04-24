SELECT
    customer_id
FROM
    customer_contracts cc
    inner join products p on cc.product_id = p.product_id
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT p.product_category) = (
        select
            count(DISTINCT product_category)
        from
            products
    );