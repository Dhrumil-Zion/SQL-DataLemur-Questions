WITH international_calls AS (
        SELECT
            caller.caller_id,
            caller.country_id as cc,
            receiver.caller_id,
            receiver.country_id rc
        FROM
            phone_calls AS calls
            LEFT JOIN phone_info AS caller ON calls.caller_id = caller.caller_id
            LEFT JOIN phone_info AS receiver ON calls.receiver_id = receiver.caller_id
    )

select
    round(
        sum(
            case
                when cc != rc then 1
                else 0
            end
        ) * 100.0 / count(*),
        1
    ) as ans
from
    international_calls;