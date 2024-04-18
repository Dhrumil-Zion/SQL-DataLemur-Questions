select
    pp.profile_id
from
    personal_profiles pp
    inner join company_pages cp on pp.employer_id = cp.company_id
where
    pp.followers > cp.followers
ORDER BY
    pp.profile_id;