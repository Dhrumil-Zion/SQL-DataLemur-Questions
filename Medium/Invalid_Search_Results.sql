SELECT
    country,
    SUM(num_search) as total_search,
    ROUND(
        SUM(num_search * invalid_result_pct * 1.0 / 100.0) * 100.0 / SUM(num_search),
        2
    ) invalid_searches_pct
FROM
    search_category
WHERE
    invalid_result_pct is not null
GROUP BY
    country
ORDER BY
    country;