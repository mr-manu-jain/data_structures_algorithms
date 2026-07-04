-- 2 test cases failed
-- WITH first_login AS (
--     SELECT user_id, MIN(activity_date) AS first_login FROM Traffic WHERE activity = 'login' GROUP BY user_id
-- )


-- SELECT activity_date AS login_date, SUM(CASE WHEN activity= 'login' THEN 1 ELSE 0 END) AS user_count FROM Traffic AS T INNER JOIN first_login AS F
-- ON T.user_id = F.user_id
-- WHERE activity_date BETWEEN '2019-04-01' AND '2019-06-30' AND T.activity_date = F.first_login
-- GROUP BY T.activity_date


WITH first_login AS (
    SELECT user_id, MIN(activity_date) AS first_login FROM Traffic WHERE activity = 'login' GROUP BY user_id
)


SELECT activity_date AS login_date, 
    COUNT(DISTINCT T.user_id) AS user_count 
FROM Traffic AS T 
INNER JOIN first_login AS F
ON T.user_id = F.user_id
WHERE activity_date BETWEEN '2019-04-01' AND '2019-06-30' 
AND T.activity_date = F.first_login
GROUP BY T.activity_date