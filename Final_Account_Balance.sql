select
    account_id,
    sum(
        case
            when transaction_type = 'Deposit' then amount
            else - amount
        end
    ) as final_balance
from
    transactions
GROUP BY
    account_id;