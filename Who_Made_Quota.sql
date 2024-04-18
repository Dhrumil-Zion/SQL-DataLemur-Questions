SELECT
    d.employee_id,
    case
        when sum(d.deal_size) >= max(sq.quota) then 'yes'
        else 'no'
    end as ans
FROM
    deals d
    inner join sales_quotas sq on d.employee_id = sq.employee_id
GROUP BY
    d.employee_id
ORDER BY
    d.employee_id;