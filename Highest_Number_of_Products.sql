select
    user_id,
    count(*) as nu_of_prod
from
    user_transactions
GROUP BY
    user_id
HAVING
    sum(spend) >= 1000
ORDER BY
    count(*) desc,
    sum(spend) desc
limit
    3;