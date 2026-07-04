/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT duration/60 AS duration_mins FROM Sessions
)

SELECT '[0-5>' AS bin,
        SUM(CASE WHEN duration_mins < 5 THEN 1 ELSE 0 END) AS total
FROM CTE
UNION ALL
SELECT '[5-10>' AS bin,
        SUM(CASE WHEN duration_mins>=5 AND duration_mins < 10 THEN 1 ELSE 0 END) AS total
FROM CTE
UNION ALL
SELECT '[10-15>' AS bin,
        SUM(CASE WHEN duration_mins>=10 AND duration_mins < 15 THEN 1 ELSE 0 END) AS total
FROM CTE
UNION ALL
SELECT '15 or more' AS bin,
        SUM(CASE WHEN duration_mins>=15 THEN 1 ELSE 0 END) AS total
FROM CTE