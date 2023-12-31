# Given the follow_list, find all profiles that are mutually following each other.

WITH tmp AS (
  SELECT user_id, following_id 
  FROM follow_list
  UNION ALL
  SELECT following_id, user_id FROM follow_list
)
SELECT t1.user_id, t1.following_id 
FROM tmp AS t1
JOIN tmp AS t2 
ON t1.user_id = t2.user_id
JOIN tmp AS t3 
ON t3.following_id = t1.user_id
AND t3.following_id = t2.following_id
GROUP BY t1.user_id, t1.following_id;