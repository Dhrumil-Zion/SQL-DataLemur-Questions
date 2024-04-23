SELECT
    ROUND(
        COUNT(texts.email_id)*1.0 / COUNT(DISTINCT emails.email_id),
        2
    ) AS activation_rate
FROM
    emails
    LEFT JOIN texts ON emails.email_id = texts.email_id
    AND texts.signup_action = 'Confirmed';