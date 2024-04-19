with
    cte as (
        SELECT
            company_id,
            count(job_id) as job
        FROM
            job_listings
        group by
            company_id,
            title,
            description
        having
            count(job_id) > 1
    )
    
SELECT
    count(company_id) as duplicate_companies
from
    cte;