/* Write your T-SQL query statement below */
WITH CTE AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY FORMAT(day, 'yyyy-MM-dd') ORDER BY amount DESC) AS rank
    FROM Transactions
)

SELECT DISTINCT transaction_id FROM CTE WHERE rank = 1 ORDER BY transaction_id ASC