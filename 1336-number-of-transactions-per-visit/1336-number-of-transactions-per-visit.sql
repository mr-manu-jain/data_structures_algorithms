WITH 
cte AS (
    SELECT V.user_id,
           V.visit_date,
           CASE WHEN T.transaction_date IS NOT NULL THEN 1 ELSE 0 END AS tt_date
    FROM Visits V
    LEFT OUTER JOIN Transactions T
        ON V.user_id = T.user_id AND V.visit_date = T.transaction_date
),
visit_grouped AS (
    SELECT user_id,
           visit_date,
           SUM(tt_date) AS transactions_count
    FROM cte 
    GROUP BY user_id, visit_date   -- fixed: group by user_id + visit_date
),
counts_summary AS (
    SELECT transactions_count, COUNT(*) AS visits_count
    FROM visit_grouped
    GROUP BY transactions_count
),
maxval AS (
    SELECT MAX(transactions_count) AS mx FROM visit_grouped
),
t_counts AS (
    SELECT 0 AS transactions_count
    UNION ALL
    SELECT transactions_count + 1
    FROM t_counts, maxval
    WHERE transactions_count + 1 <= mx
)
SELECT t.transactions_count,
       ISNULL(cs.visits_count, 0) AS visits_count
FROM t_counts t
LEFT JOIN counts_summary cs
    ON t.transactions_count = cs.transactions_count
ORDER BY t.transactions_count
OPTION (MAXRECURSION 0);