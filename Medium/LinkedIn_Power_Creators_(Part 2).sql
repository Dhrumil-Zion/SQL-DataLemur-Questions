select
    pp.profile_id
from
    personal_profiles pp
    inner join employee_company ec on pp.profile_id = ec.personal_profile_id
    inner join company_pages cp on ec.company_id = cp.company_id
GROUP BY
    pp.profile_id
HAVING
    max(pp.followers) > max(cp.followers)
ORDER BY
    pp.profile_id;