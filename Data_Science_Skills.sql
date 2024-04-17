SELECT 
  candidate_id 
FROM 
  candidates 
where 
  skill in ('Python', 'Tableau', 'PostgreSQL') 
GROUP BY 
  candidate_id 
HAVING 
  COUNT(candidate_id) = 3 
ORDER BY 
  candidate_id ASC
