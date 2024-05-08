WITH
    cte as (
        select
            user_id,
            session_type,
            sum(duration) as duration
        FROM
            sessions
        WHERE
            date (start_date) >= date ('2022-01-01')
            and date (start_date) <= date ('2022-02-01')
        GROUP BY
            user_id,
            session_type
    )

    
SELECT
    user_id,
    session_type,
    row_number() OVER (
        PARTITION BY
            session_type
        ORDER BY
            duration DESC
    ) as rank
FROM
    cte;