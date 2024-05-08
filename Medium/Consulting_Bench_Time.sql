with
    cte as (
        SELECT
            employee_id,
            sum(end_date - start_date) AS dd,
            COUNT(*) as cnt
        FROM
            staffing s
            inner JOIN consulting_engagements ce on s.job_id = ce.job_id
            and s.is_consultant = 'true'
        GROUP BY
            employee_id
    )
    
SELECT
    employee_id,
    365 - dd - cnt as ans
FROM
    cte;