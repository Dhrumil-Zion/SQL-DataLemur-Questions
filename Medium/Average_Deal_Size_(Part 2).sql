WITH segment_cte AS (
SELECT
    customer_id,
    CASE
    WHEN employee_count < 100 THEN 'smb'
    WHEN employee_count BETWEEN 100 AND 999 THEN 'mid'
    ELSE 'enterprise'
    END AS segment
FROM customers
)
, revenue_cte AS (
SELECT
    seg.segment,
    SUM(contracts.num_seats * contracts.yearly_seat_cost) 
    / COUNT(DISTINCT seg.customer_id) AS avg_revenue
FROM segment_cte AS seg
INNER JOIN contracts 
    ON seg.customer_id = contracts.customer_id
GROUP BY seg.segment
)

SELECT
SUM(CASE WHEN segment = 'smb' THEN avg_revenue END) AS smb_avg_revenue,
SUM(CASE WHEN segment = 'mid' THEN avg_revenue END) AS mid_avg_revenue,
SUM(CASE WHEN segment = 'enterprise' THEN avg_revenue END) AS enterprise_avg_revenue
FROM revenue_cte;