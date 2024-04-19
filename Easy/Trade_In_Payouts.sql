select
    tt.store_id,
    sum(tp.payout_amount) as payout_total
from
    trade_in_transactions tt
    inner join trade_in_payouts tp on tt.model_id = tp.model_id
group by
    tt.store_id
ORDER BY
    payout_total desc;