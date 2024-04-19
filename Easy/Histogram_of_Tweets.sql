with cte as 
(
SELECT user_id,count(*) as total_tweet FROM tweets
where date_part('year',tweet_date) = 2022
group by user_id
)

select total_tweet,count(*) users_num 
from cte
group by total_tweet;
