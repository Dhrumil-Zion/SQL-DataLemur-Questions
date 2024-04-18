with
    cte as (
        select
            employee_id,
            COUNT(distinct domain) as total_domain,
            sum(years_of_experience) as total_exp
        from
            employee_expertise
        GROUP BY
            employee_id
        HAVING
            COUNT(distinct domain) < 3
    )
    
select
    employee_id
from
    cte
where
    (
        total_domain = 1
        and total_exp >= 8
    )
    or (
        total_domain = 2
        and total_exp >= 12
    );