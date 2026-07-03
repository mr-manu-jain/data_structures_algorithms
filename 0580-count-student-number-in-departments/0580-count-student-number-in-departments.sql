/* Write your T-SQL query statement below */

SELECT D.dept_name,
       COUNT(S.student_id) AS student_number
FROM Department D
LEFT OUTER JOIN Student S
ON D.dept_id = S.dept_id
GROUP BY D.dept_name
ORDER BY COUNT(DISTINCT S.student_id) DESC, D.dept_name