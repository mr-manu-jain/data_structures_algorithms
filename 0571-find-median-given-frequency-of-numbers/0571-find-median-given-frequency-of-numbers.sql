-- /* Write your T-SQL query statement below */

WITH Temp AS (
    SELECT num,
           frequency,
           SUM(frequency) OVER (ORDER BY num ASC) AS rnk1,
           SUM(frequency) OVER (ORDER BY num DESC) AS rnk2
    FROM Numbers
)

SELECT AVG(num * 1.0) AS median
FROM Temp
WHERE ABS(rnk1-rnk2) <= frequency
-- WITH running_sum AS (
--     SELECT 
--         num,
--         frequency,
--         SUM(frequency) OVER (ORDER BY num ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
--         SUM(frequency) OVER () AS total_sum
-- FROM Numbers
-- )

-- SELECT CAST(AVG(1.0*num) AS DECIMAL(10,1)) AS median 
-- FROM running_sum 
-- WHERE total_sum/2.0 BETWEEN (running_total-frequency) AND running_total