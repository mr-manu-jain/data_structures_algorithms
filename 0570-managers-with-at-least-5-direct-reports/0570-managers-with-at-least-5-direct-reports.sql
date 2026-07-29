/* Write your T-SQL query statement below */
WITH reportee_counts AS (
    SELECT managerId,
            COUNT(DISTINCT id) AS reportees
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(DISTINCT id) >= 5
    
)

SELECT A.name FROM reportee_counts B INNER JOIN Employee A ON B.managerId = A.id