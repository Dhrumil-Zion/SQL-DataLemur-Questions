with
    cte as (
        SELECT
            contact_id,
            event_type,
            date_part ('week', event_date) - row_number() OVER (
                PARTITION BY
                    contact_id
                ORDER BY
                    date_part ('week', event_date)
            ) as chk
        FROM
            marketing_touches
    ),
    tbl as (
        SELECT
            contact_id,
            chk,
            string_agg (event_type, ' , ') as list_of_events
        from
            cte
        GROUP BY
            contact_id,
            chk
        HAVING
            COUNT(*) > 2
    )
    
SELECT
    cc.email
FROM
    tbl
    inner join crm_contacts cc on tbl.contact_id = cc.contact_id
where
    tbl.list_of_events like '%trial_request%';