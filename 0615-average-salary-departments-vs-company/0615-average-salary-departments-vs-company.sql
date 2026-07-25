/* Write your T-SQL query statement below */
WITH monthly_salary AS (
    SELECT FORMAT(pay_date,'yyyy-MM') AS pay_month,
    AVG(amount) AS avg_pay
    FROM Salary
    GROUP BY FORMAT(pay_date,'yyyy-MM')
),
dept_avg AS (
    SELECT FORMAT(s.pay_date,'yyyy-MM') AS pay_month,
    e.department_id,
    AVG(s.amount) AS avg_pay
    FROM Salary AS s
    INNER JOIN Employee AS e
    ON s.employee_id = e.employee_id
    GROUP BY FORMAT(pay_date,'yyyy-MM'), department_id
)

SELECT d.pay_month,
        d.department_id,
        CASE WHEN d.avg_pay = m.avg_pay THEN 'same' WHEN d.avg_pay > m.avg_pay THEN 'higher' ELSE 'lower' END AS comparison
FROM dept_avg as d
INNER JOIN monthly_salary AS m
ON d.pay_month = m.pay_month