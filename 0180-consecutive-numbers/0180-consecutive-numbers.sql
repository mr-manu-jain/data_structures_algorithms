/* Write your T-SQL query statement below */

WITH CTE AS (
    SELECT id,
            num,
            LEAD(num) OVER(ORDER BY id) AS next_num,
            LEAD(num,2) OVER(ORDER BY id) AS next_to_next_num
    FROM Logs
)

SELECT DISTINCT(num) AS ConsecutiveNums FROM CTE WHERE num = next_num AND num = next_to_next_num


-- above one is better
-- SELECT DISTINCT
--     l1.Num AS ConsecutiveNums
-- FROM
--     Logs l1,
--     Logs l2,
--     Logs l3
-- WHERE
--     l1.Id = l2.Id - 1
--     AND l2.Id = l3.Id - 1
--     AND l1.Num = l2.Num
--     AND l2.Num = l3.Num
-- ;