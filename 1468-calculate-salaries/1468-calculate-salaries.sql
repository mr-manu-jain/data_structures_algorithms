# Write your MySQL query statement below
WITH max_salaries AS (
    SELECT company_id,
           MAX(salary) AS max_salary
    FROM Salaries
    GROUP BY company_id
)
SELECT A.company_id,
        A.employee_id,
        A.employee_name,
        CASE WHEN B.max_salary  < 1000 THEN A.salary
        WHEN B.max_salary>=1000 AND B.max_salary <=10000 THEN ROUND(A.salary*0.76,0)
        ELSE ROUND(A.salary*0.51,0) END AS salary
FROM Salaries AS A INNER JOIN max_salaries AS B ON A.company_id = B.company_id