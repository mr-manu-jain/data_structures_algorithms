SELECT MAX(salary) AS SecondHighestSalary FROM Employee WHERE salary < (
    SELECT MAX(salary) FROM Employee
)
-- SELECT MAX(salary) AS SecondHighestSalary FROM Employee WHERE salary < (
--     SELECT MAX(salary) FROM Employee
-- )

-- WITH CTE AS (
--     SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
--     FROM Employee
-- )

-- SELECT MAX(salary) AS SecondHighestSalary FROM CTE WHERE rank = 2