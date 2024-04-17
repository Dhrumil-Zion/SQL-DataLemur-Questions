SELECT
    e.user_id
FROM
    emails e
    inner join texts t on t.email_id = e.email_id
where
    e.signup_date + interval '1 day' = t.action_date
    and t.signup_action = 'Confirmed';