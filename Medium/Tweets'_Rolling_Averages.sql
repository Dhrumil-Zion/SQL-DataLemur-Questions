SELECT
    user_id,
    tweet_date,
    round(
        avg(tweet_count) OVER (
            PARTITION BY
                user_id
            ORDER BY
                tweet_date ROWS 2 PRECEDING
        ),
        2
    ) running_total
FROM
    tweets;