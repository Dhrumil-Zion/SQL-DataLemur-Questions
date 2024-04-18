with
    cte as (
        select
            datacenter_id,
            sum(monthly_demand) as total_mon_useage
        from
            forecasted_demand
        GROUP BY
            datacenter_id
    )
    
select
    c.datacenter_id,
    (d.monthly_capacity - c.total_mon_useage) as spare
from
    cte c
    inner join datacenters d on c.datacenter_id = d.datacenter_id
order by
    c.datacenter_id;