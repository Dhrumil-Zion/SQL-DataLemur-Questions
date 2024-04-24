with
    cte as (
        select
            booking_id,
            user_id
        from
            (
                select
                    *,
                    row_number() OVER (
                        PARTITION BY
                            user_id
                        ORDER BY
                            booking_date
                    ) as rn
                from
                    bookings
            ) te
        where
            rn = 1
    ),
    tbl as (
        select
            case
                when channel is null then 'NAN'
                else channel
            end as channel,
            COUNT(channel) OVER (
                PARTITION BY
                    channel
            ) as app
        from
            cte c
            inner join booking_attribution ba on c.booking_id = ba.booking_id
    ),
    tb as (
        select distinct
            channel,
            round(app * 100.0 / COUNT(channel) OVER ()) as prc
        from
            tbl
    )
    
select
    *
from
    tb
where
    channel != 'NAN'
ORDER BY
    prc DESC
LIMIT
    1;