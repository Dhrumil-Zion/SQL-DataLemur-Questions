select
    item_count
from
    (
        SELECT
            *,
            dense_rank() OVER (
                ORDER BY
                    order_occurrences desc
            ) as rn
        FROM
            items_per_order
    ) A
where
    rn = 1
ORDER BY
    item_count;