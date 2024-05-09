WITH cte as (
SELECT *,
dense_rank() OVER(PARTITION BY ticker ORDER BY open) as lowest,
dense_rank() OVER(PARTITION BY ticker ORDER BY open DESC) as highest
FROM stock_prices)

SELECT ticker,
MAX(CASE WHEN highest = 1 then to_char ( date, 'Mon-YYYY' ) else null end) as h_mnt,
MAX(CASE WHEN highest = 1 then open else 0 end) as h_open,
MAX(CASE WHEN lowest = 1 then to_char ( date, 'Mon-YYYY' ) else null end ) as l_mnt,
MAX(CASE WHEN lowest = 1 then open else 0 end ) as l_open
FROM cte 
WHERE lowest =1 or highest = 1
GROUP BY ticker;