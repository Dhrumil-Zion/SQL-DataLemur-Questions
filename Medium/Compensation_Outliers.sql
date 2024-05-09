WITH
    cte as (
        SELECT
            employee_id,
            salary,
            ROUND(
                AVG(salary) OVER (
                    PARTITION BY
                        title
                )
            ) as avg_sal
        FROM
            employee_pay
    )


SELECT *
FROM
    (
        SELECT
            employee_id,
            salary,
            CASE
                WHEN salary > avg_sal * 2 then 'Overpaid'
                WHEN salary < avg_sal * 1.0 / 2.0 then 'Underpaid'
            end as ans
        FROM
            cte
    ) temo
WHERE
    ans is not null;