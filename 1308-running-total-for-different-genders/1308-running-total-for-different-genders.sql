/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT gender,
           day,
           SUM(score_points) OVER (PARTITION BY gender ORDER BY day) AS total
    FROM Scores
)

SELECT *
FROM CTE
ORDER BY gender