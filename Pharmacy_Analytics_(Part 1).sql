SELECT
    drug,
    sum(total_sales - cogs) as profit
FROM
    pharmacy_sales
GROUP BY
    drug
order by
    profit desc
limit
    3;