WITH
    cte as (
        SELECT
            *
        from
            (
                SELECT
                    *,
                    dense_rank() OVER (
                        PARTITION BY
                            department_id
                        ORDER BY
                            salary DESC
                    ) rn
                FROM
                    employee
            ) tmp
        where
            rn < 4
    )
    
SELECT
    d.department_name,
    c.name,
    c.salary
FROM
    cte c
    inner join department d on c.department_id = d.department_id
ORDER BY
    c.department_id,
    c.salary DESC,
    c.name;