select
    pi.product_line,
    sum(t.amount) as amt
from
    product_info pi
    inner join transactions t on pi.product_id = t.product_id
GROUP BY
    pi.product_line
ORDER BY
    amt desc;