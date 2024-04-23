with
    cte as (
        SELECT
            (num_seats * yearly_seat_cost) * 1.0 as total_per_year,
            count(*) over () as total_count
        FROM
            contracts
    )
    
select
    round(sum(total_per_year) * 1.0 / max(total_count), 2)
from
    cte;