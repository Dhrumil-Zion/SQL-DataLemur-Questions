SELECT
    app_id,
    ROUND(
        100.0 * (
            COUNT(
                CASE
                    WHEN event_type LIKE 'click' THEN 1
                END
            )
        ) / COUNT(
            CASE
                WHEN event_type LIKE 'impression' THEN 1
            END
        ),
        2
    )
FROM
    events
WHERE
    EXTRACT(
        YEAR
        FROM
            timestamp
    ) = 2022
GROUP BY
    app_id;