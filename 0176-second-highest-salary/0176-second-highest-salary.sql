-- WITH CTE AS (
--     SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
--     FROM Employee
-- )

-- SELECT MAX(salary) AS SecondHighestSalary FROM CTE WHERE rank = 2



WITH CTE AS (
    SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary FROM CTE WHERE rank = 2