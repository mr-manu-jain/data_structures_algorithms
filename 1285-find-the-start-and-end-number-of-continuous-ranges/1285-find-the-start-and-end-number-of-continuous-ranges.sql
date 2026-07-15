/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT ROW_NUMBER() OVER (ORDER BY log_id) AS s_no,
        log_id
        -- LEAD(log_id) OVER (ORDER BY log_id) AS next_log,
        -- LAG(log_id) OVER (ORDER BY log_id) AS prev_log
    FROM Logs
    GROUP BY log_id
),
grouping AS (
SELECT *, 
       log_id-s_no AS diff1
FROM CTE)

SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id FROM grouping GROUP BY diff1