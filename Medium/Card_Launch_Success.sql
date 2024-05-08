with
    cte as (
        SELECT *, row_number() OVER (
                PARTITION BY
                    card_name
                ORDER BY
                    issue_year,
                    issue_month
            ) as rn
        FROM
            monthly_cards_issued
    )

select
    card_name,
    issued_amount
from
    cte
where
    rn = 1
ORDER BY
    issued_amount DESC;