select
    customer_id,
    max(purchase_amount) as p_amount
from
    transactions
GROUP BY
    customer_id
ORDER BY
    p_amount desc;