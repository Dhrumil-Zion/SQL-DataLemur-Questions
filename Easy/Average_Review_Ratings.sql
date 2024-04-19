SELECT
    date_part ('month', submit_date) as mnth,
    product_id,
    round(AVG(stars), 2) as avg_stars
FROM
    reviews
group by
    date_part ('month', submit_date),
    product_id
order by
    date_part ('month', submit_date),
    product_id;