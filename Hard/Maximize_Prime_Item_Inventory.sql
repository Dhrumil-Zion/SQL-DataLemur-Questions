WITH summary AS (
  SELECT 
    SUM(square_footage) FILTER (WHERE item_type = 'prime_eligible') AS prime_sq_ft,
    COUNT(item_id) FILTER (WHERE item_type = 'prime_eligible') AS prime_item_count,
    SUM(square_footage) FILTER (WHERE item_type = 'not_prime') AS not_prime_sq_ft,
    COUNT(item_id) FILTER (WHERE item_type = 'not_prime') AS not_prime_item_count
  FROM inventory
),
prime_occupied_area AS (
  SELECT FLOOR(500000/prime_sq_ft)*prime_sq_ft AS max_prime_area
  FROM summary
)

SELECT 
  'prime_eligible' AS item_type,
  FLOOR(500000/prime_sq_ft)*prime_item_count AS item_count
FROM summary

UNION ALL

SELECT 
  'not_prime' AS item_type,
  FLOOR((500000-(SELECT max_prime_area FROM prime_occupied_area)) 
    / not_prime_sq_ft) * not_prime_item_count AS item_count
FROM summary;