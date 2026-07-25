/* Write your T-SQL query statement below */
WITH monthly_salary AS (
    SELECT CONVERT(VARCHAR(7), pay_date, 126) AS pay_month,
    AVG(amount) AS avg_pay
    FROM Salary
    GROUP BY CONVERT(VARCHAR(7), pay_date, 126)
),
dept_avg AS (
    SELECT CONVERT(VARCHAR(7), pay_date, 126) AS pay_month,
    e.department_id,
    AVG(s.amount) AS avg_pay
    FROM Salary AS s
    LEFT OUTER JOIN Employee AS e
    ON s.employee_id = e.employee_id
    GROUP BY CONVERT(VARCHAR(7), pay_date, 126), department_id
)

SELECT d.pay_month,
        d.department_id,
        CASE WHEN d.avg_pay = m.avg_pay THEN 'same' WHEN d.avg_pay > m.avg_pay THEN 'higher' ELSE 'lower' END AS comparison
FROM dept_avg as d
INNER JOIN monthly_salary AS m
ON d.pay_month = m.pay_month