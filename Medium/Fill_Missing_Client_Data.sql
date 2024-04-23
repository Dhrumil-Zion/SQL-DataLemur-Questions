WITH
    filled_category AS (
        SELECT
            *,
            COUNT(category) OVER (
                ORDER BY
                    product_id
            ) AS numbered_category
        FROM
            products
    )
    
SELECT
    product_id,
    COALESCE(
        category,
        MAX(category) OVER (
            PARTITION BY
                numbered_category
        )
    ) AS category,
    name
FROM
    filled_category;