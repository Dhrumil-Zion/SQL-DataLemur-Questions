with
    cte as (
        SELECT
            measurement_value,
            measurement_time::date,
            row_number() OVER (
                PARTITION BY
                    measurement_time::date
                ORDER BY
                    measurement_time
            ) as rn
        FROM
            measurements
    )

select
    measurement_time,
    sum(
        case
            when rn % 2 != 0 then measurement_value
            else 0
        end
    ) as odd_sum,
    sum(
        case
            when rn % 2 = 0 then measurement_value
            else 0
        end
    ) as even_sum
from
    cte
GROUP BY
    measurement_time;