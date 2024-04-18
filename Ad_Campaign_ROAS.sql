select
    advertiser_id,
    round((sum(revenue) * 1.0 / sum(spend))::DECIMAL, 2) as ROAS
from
    ad_campaigns
GROUP BY
    advertiser_id
ORDER BY
    advertiser_id;