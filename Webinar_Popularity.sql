select
    round(
        sum(
            case
                when event_type = 'webinar' then 1
                else 0
            end
        ) * 100.0 / count(event_id) * 1.0
    )
from
    marketing_touches
where
    date_part ('year', event_date) = 2022
    and date_part ('month', event_date) = 4;