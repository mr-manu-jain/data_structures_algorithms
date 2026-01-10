-- https://leetcode.com/problems/users-that-actively-request-confirmation-messages/description/

/* Write your T-SQL query statement below */
-- on confirmations, run a dense rank, partition by userid, sort by timestamp
-- find datediff with the prev rank, using LAG, (,aybe dense rank not required all together)
-- finally select distinct user_ids where t_diff < 24 hours
WITH 
CTE2 AS (
    SELECT user_id, time_stamp, 
    LAG(time_stamp) OVER (PARTITION BY user_id ORDER BY time_stamp) AS prev_timestamp
    FROM Confirmations
    
)

SELECT DISTINCT user_id FROM CTE2
WHERE prev_timestamp IS NOT NULL AND DATEDIFF(second, prev_timestamp, time_stamp) <= 86400;