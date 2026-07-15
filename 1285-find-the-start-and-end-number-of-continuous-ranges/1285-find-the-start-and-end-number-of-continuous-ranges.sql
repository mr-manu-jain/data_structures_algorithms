/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT ROW_NUMBER() OVER (ORDER BY log_id) AS s_no,
        log_id
    FROM Logs
    GROUP BY log_id
)

SELECT MIN(log_id) AS start_id, 
        MAX(log_id) AS end_id 
FROM CTE 
GROUP BY log_id-s_no 