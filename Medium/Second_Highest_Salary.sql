WITH
    cte as (
        SELECT
            *,
            dense_rank() OVER (
                ORDER BY
                    salary DESC
            ) as rn
        FROM
            employees
    )
    
SELECT
    salary
FROM
    cte
WHERE
    rn = 2;