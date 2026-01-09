-- https://leetcode.com/problems/find-covid-recovery-patients/

WITH ranking AS (
    SELECT *,
            ROW_NUMBER() OVER(PARTITION BY patient_id, result ORDER BY test_date) AS rank1
    FROM covid_tests),


ranking2 AS (
    SELECT c1.patient_id,
            ROW_NUMBER() OVER(PARTITION BY c1.patient_id ORDER BY c2.test_date) AS rank2,
            DATEDIFF(DAY, c1.test_date, c2.test_date) AS recovery_time
    FROM ranking AS c1
    LEFT OUTER JOIN ranking AS c2
    ON c1.patient_id = c2.patient_id
    AND c1.test_date < c2.test_date
    WHERE c1.result = 'Positive' AND c1.rank1 = 1 AND c2.result = 'Negative'
)

SELECT r.patient_id,
        p.patient_name,
        p.age,
        r.recovery_time
FROM ranking2 AS r 
LEFT JOIN patients AS p
ON r.patient_id = p.patient_id
WHERE r.rank2 = 1
ORDER BY r.recovery_time, p.patient_name