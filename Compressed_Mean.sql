select
    round(mean::numeric, 1)
from
    (
        SELECT
            sum(item_count * order_occurrences) * 1.0 / sum(order_occurrences) as mean
        FROM
            items_per_order
    ) A;