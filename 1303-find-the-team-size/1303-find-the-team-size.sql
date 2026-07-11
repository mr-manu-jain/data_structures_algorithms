/* Write your T-SQL query statement below */

SELECT employee_id,
       COUNT(team_id) OVER(PARTITION BY team_id) team_size
FROM Employee
-- WITH CTE AS (SELECT team_id, COUNT(employee_id) AS team_size FROM Employee GROUP BY team_id)

-- SELECT employee_id,
--        C.team_size
-- FROM Employee LEFT OUTER JOIN CTE C ON Employee.team_id = C.team_id