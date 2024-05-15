WITH summary AS (
SELECT item_count
FROM items_per_order
GROUP BY
  item_count,
  GENERATE_SERIES(1, order_occurrences)
)

SELECT 
  ROUND(
    PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY item_count)::DECIMAL, 1) AS median
FROM summary;