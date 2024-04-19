SELECT
    sender_id,
    count(*) as no_msg
FROM
    messages
where
    date_part ('month', sent_date) = 8 and date_part ('year', sent_date) = 2022
GROUP BY
    sender_id
ORDER BY
    COUNT(*) desc
limit 2;