with
    cte as (
        select
            merchant_id,
            sum(transaction_amount) as total_transaction
        from
            transactions
        where
            lower(payment_method) = 'apple pay'
        GROUP BY
            merchant_id
    ),
    cte2 as (
        select distinct
            merchant_id
        from
            transactions
    )
    
select
    c2.merchant_id,
    case
        when c1.total_transaction is null then 0
        else total_transaction
    end as op
from
    cte2 c2
    left join cte c1 on c2.merchant_id = c1.merchant_id
ORDER BY
    op desc;