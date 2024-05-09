with
    cnt_info as (
        SELECT
            caller_id,
            COUNT(*) as cnt
        FROM
            (
                SELECT
                    caller_id
                FROM
                    phone_calls
                UNION ALL
                SELECT
                    receiver_id
                FROM
                    phone_calls
            ) trmp
        GROUP BY
            caller_id
    )
    
SELECT
    sum(c.cnt)
from
    cnt_info c
    inner join phone_info p on c.caller_id = p.caller_id
WHERE
    p.phone_number like '+1-212%';




--------------------------------- Optimized Solution -----------------------------------
-- SELECT 
--   SUM(
--     CASE WHEN caller.phone_number LIKE '+1-212%' THEN 1
--       WHEN receiver.phone_number LIKE '+1-212%' THEN 1
--     ELSE 0 END) AS nyc_count
-- FROM phone_calls
-- LEFT JOIN phone_info AS caller
--   ON phone_calls.caller_id = caller.caller_id
-- LEFT JOIN phone_info AS receiver
--   ON phone_calls.receiver_id = receiver.caller_id;