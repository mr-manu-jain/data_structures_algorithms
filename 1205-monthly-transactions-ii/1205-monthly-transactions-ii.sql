WITH approved_transactions AS (
    SELECT FORMAT(trans_date, 'yyyy-MM') AS month,
    country,
    COUNT(DISTINCT id) AS approved_count,
    SUM(amount) AS approved_amount,
    0 AS chargeback_count,
    0 AS chargeback_amount
    FROM Transactions
    WHERE state = 'approved'
    GROUP BY FORMAT(trans_date, 'yyyy-MM'), country
),
chargebacks_aggregated AS (
    SELECT FORMAT(C.trans_date, 'yyyy-MM') AS month,
    T.country,
    0 AS approved_count,
    0 AS approved_amount,
    COUNT(DISTINCT id) AS chargeback_count,
    SUM(amount) AS chargeback_amount
    FROM Chargebacks C
    INNER JOIN Transactions T
    ON T.id = C.trans_id
    GROUP BY FORMAT(C.trans_date, 'yyyy-MM'), country
)

SELECT 
    month,
    country,
    MAX(approved_count) AS approved_count,
    MAX(approved_amount) AS approved_amount,
    MAX(chargeback_count) AS chargeback_count,
    MAX(chargeback_amount) AS chargeback_amount
FROM (
    SELECT *
    FROM approved_transactions
    UNION ALL
    SELECT *
    FROM chargebacks_aggregated
) AS CombinedData
GROUP BY month, country;

-- /* Write your T-SQL query statement below */
-- WITH transactions_with_chargebacks AS (
--     SELECT 
--     FORMAT(T.trans_date, 'yyyy-MM') AS month,
--     T.country,
--     T.id,
--     T.amount,
--     C.trans_date,
--     C.trans_id,
--     T.state
--     FROM Transactions T
--     LEFT OUTER JOIN Chargebacks C
--     ON T.id = C.trans_id
-- )

-- SELECT month, 
--         country, 
--         SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,
--         SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_amount,
--         SUM(CASE WHEN trans_id IS NOT NULL THEN 1 ELSE 0 END) AS chargeback_count,
--         SUM(CASE WHEN trans_id IS NOT NULL THEN amount ELSE 0 END) AS chargeback_amount
-- FROM transactions_with_chargebacks
-- GROUP BY month, country