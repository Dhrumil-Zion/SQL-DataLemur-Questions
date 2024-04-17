SELECT
    u.city,
    count(*) as no_of_trads
FROM
    trades t
    inner join users u on t.user_id = u.user_id
where
    t.status = 'Completed'
GROUP BY
    u.city
ORDER BY
    count(*) desc
limit
    3;