with
    cte as (
        SELECT
            user_id,
            round(
                sum(
                    case
                        when activity_type = 'send' then time_spent
                        else 0
                    end
                ) * 100.0 / sum(
                    case
                        when activity_type = 'open'
                        or activity_type = 'send' then time_spent
                        else 0
                    end
                ),
                2
            ) as send_perc,
            round(
                sum(
                    case
                        when activity_type = 'open' then time_spent
                        else 0
                    end
                ) * 100.0 / sum(
                    case
                        when activity_type = 'open'
                        or activity_type = 'send' then time_spent
                        else 0
                    end
                ),
                2
            ) as open_perc
        FROM
            activities
        GROUP BY
            user_id
    )
    
select
    ab.age_bucket,
    c.send_perc,
    c.open_perc
from
    cte c
    inner join age_breakdown ab on c.user_id = ab.user_id
ORDER BY
    ab.age_bucket;