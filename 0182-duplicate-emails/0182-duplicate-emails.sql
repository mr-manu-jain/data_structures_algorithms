/* Write your T-SQL query statement below */
SELECT DISTINCT email FROM Person GROUP BY email HAVING COUNT(id) > 1