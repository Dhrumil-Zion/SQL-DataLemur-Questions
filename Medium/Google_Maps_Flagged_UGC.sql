with
    cte as (
        select
            mp.place_id,
            pi.place_category
        from
            maps_ugc_review mp
            inner join place_info pi on mp.place_id = pi.place_id
        where
            mp.content_tag = 'Off-topic'
    ),
    te as (
        select
            place_category,
            COUNT(*) as cnt,
            RANK() OVER (
                ORDER BY
                    COUNT(*) desc
            ) as rn
        from
            cte
        GROUP BY
            place_category
    )
    
select
    place_category
from
    te
where
    rn = 1
ORDER BY
    place_category;