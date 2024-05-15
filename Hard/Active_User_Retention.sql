with
    cte as (
        SELECT
            user_id,
            event_type,
            date_part ('month', event_date) as curr_mon,
            lag (date_part ('month', event_date), 1) OVER (
                PARTITION BY
                    user_id
                ORDER BY
                    event_date
            ) as prev_month
        FROM
            user_actions
        where
            event_type in ('sign-in', 'like', 'comment')
    ),
    tbl as (
        select
            *,
            case
                when curr_mon = prev_month + 1 then 1
                else 0
            end as chk
        from
            cte
    )
    
select
    curr_mon,
    count(distinct user_id) as mau
from
    tbl
where
    chk = 1
    and curr_mon = 7
GROUP BY
    curr_mon;