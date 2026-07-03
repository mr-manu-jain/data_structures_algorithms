/* Write your T-SQL query statement below */
WITH Activity_Count AS (
    SELECT activity,
           COUNT(id) AS activity_count
    FROM Friends
    GROUP BY activity
)


SELECT activity FROM Activity_Count WHERE
activity_count < (SELECT MAX(activity_count) AS maxx FROM Activity_Count) AND 
activity_count > (SELECT MIN(activity_count) AS minn FROM Activity_Count)