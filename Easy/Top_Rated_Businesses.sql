select
    sum(
        case
            when review_stars > 3 then 1
            else 0
        end
    ) as business_count,
    round(
        sum(
            case
                when review_stars > 3 then 1
                else 0
            end
        ) * 100.0 / count(distinct business_id)
    ) as top_rated_pct
from
    reviews