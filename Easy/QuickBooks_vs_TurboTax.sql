select
    sum(
        case
            when product like 'T%' then 1
            else 0
        end
    ) as turbotax_total,
    sum(
        case
            when product like 'Q%' then 1
            else 0
        end
    ) as quickbooks_total
from
    filed_taxes;