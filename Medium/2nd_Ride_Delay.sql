with
    cte as (
        select
            r.user_id,
            u.registration_date,
            r.ride_date,
            u.registration_date - r.ride_date as chk
        FROM
            users u
            inner join rides r on u.user_id = r.user_id
    ),
    tbl as (
        select
            user_id,
            registration_date,
            ride_date,
            row_number() OVER (
                PARTITION BY
                    user_id
                ORDER BY
                    ride_date
            ) as rn
        from
            cte
        where
            user_id in (
                select
                    user_id
                from
                    cte
                where
                    chk = 0
            )
    ),
    delay as (
        select
            user_id,
            max(ride_date) - min(ride_date) as delay_dff
        from
            tbl
        where
            rn in (1, 2)
        GROUP BY
            user_id
        HAVING
            COUNT(*) > 1
    )
    
select
    round(avg(delay_dff), 2)
from
    delay;

-------------- Optimized Query ----------------

-- WITH moment_users AS (
--   SELECT DISTINCT users.user_id
--   FROM users 
--   INNER JOIN rides
--     ON users.user_id = rides.user    _id
--     AND users.registration_date = rides.ride_date
-- )
-- , rides_cte AS (
--   SELECT 
--     rides.user_id,
--     rides.ride_date,
--     ROW_NUMBER() OVER (
--       PARTITION BY users.user_id 
--       ORDER BY rides.ride_date) AS ride_nr,
--     LAG(rides.ride_date) OVER (
--       PARTITION BY users.user_id 
--       ORDER BY rides.ride_date) AS lag_ride_date
--   FROM moment_users AS users
--   LEFT JOIN rides
--     ON users.user_id = rides.user_id
-- )

-- SELECT ROUND(AVG(ride_date - lag_ride_date),2) AS average_delay
-- FROM rides_cte
-- WHERE ride_nr=2;