with
    cte as (
        select
            user_id,
            song_id,
            1
        from
            songs_weekly
        where
            date_part ('year', listen_time) <= 2022
            and date_part ('month', listen_time) <= 8
            and date_part ('day', listen_time) <= 4
    ),
    cte2 as (
        select
            user_id,
            song_id,
            song_plays
        from
            songs_history
        where
            song_id in (
                select
                    song_id
                from
                    cte
            )
        UNION ALL
        select
            *
        from
            cte
    )

select
    user_id,
    song_id,
    sum(song_plays) as song_plays
from
    cte2
GROUP BY
    user_id,
    song_id
ORDER BY
    song_plays desc;