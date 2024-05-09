with
    deals_final as (
        SELECT
            employee_id,
            SUM(deal_size) as total_deal_size
        FROM
            deals
        GROUP BY
            employee_id
    )
    
SELECT
    ec.employee_id,
    CASE
        when df.total_deal_size >= ec.quota then ec.base + (commission * quota) + (df.total_deal_size - ec.quota) * ec.commission * ec.accelerator
        ELSE ec.base + (commission * df.total_deal_size)
    END as final_sal
FROM
    deals_final df
    inner join employee_contract ec on df.employee_id = ec.employee_id
ORDER BY
    final_sal DESC,
    ec.employee_id;