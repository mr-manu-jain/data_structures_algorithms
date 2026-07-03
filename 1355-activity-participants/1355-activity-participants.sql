/* Write your T-SQL query statement below */
WITH Activity_Count AS (
    SELECT activity,
           COUNT(id) AS activity_count,
           MAX(COUNT(id)) OVER() AS max_count,
           MIN(COUNT(id)) OVER() AS min_count
    FROM Friends
    GROUP BY activity
)

-- SELECT * FROM Activity_Count
SELECT activity FROM Activity_Count WHERE
activity_count < max_count AND 
activity_count > min_count