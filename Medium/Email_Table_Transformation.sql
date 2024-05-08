SELECT
    user_id,
    MAX(
        case
            WHEN email_type = 'personal' then email
            else null
        end
    ) as personal,
    MAX(
        case
            WHEN email_type = 'business' then email
            else null
        end
    ) as business,
    MAX(
        case
            WHEN email_type = 'recovery' then email
            else null
        end
    ) as recovery
FROM
    users
GROUP BY
    user_id
ORDER BY
    user_id;