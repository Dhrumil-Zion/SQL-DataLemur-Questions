SELECT
    round(
        sum(
            case
                when call_category is null
                or call_category = 'n/a' then 1
                else 0
            end
        ) * 100.0 / count(*),
        1
    )
FROM
    callers;