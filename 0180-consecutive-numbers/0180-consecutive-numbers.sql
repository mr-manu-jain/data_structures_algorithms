/* Write your T-SQL query statement below */

WITH CTE AS (
    SELECT id,
            num,
            LEAD(num) OVER(ORDER BY id) AS next_num,
            LEAD(num,2) OVER(ORDER BY id) AS next_to_next_num
    FROM Logs
)

SELECT DISTINCT(num) AS ConsecutiveNums FROM CTE WHERE num = next_num AND num = next_to_next_num