WITH
    cte as (
        SELECT
            date,
            ticker,
            close,
            lag (close, 1) OVER (
                PARTITION BY
                    ticker
                ORDER BY
                    date
            ) as prev_value
        FROM
            stock_prices
    )
    
SELECT
    ticker,
    date,
    close,
    ROUND((close - prev_value) * 100.0 / prev_value, 2) as pct
FROM
    cte
ORDER BY
    ticker,
    date;