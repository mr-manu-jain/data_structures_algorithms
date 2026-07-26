/* Write your T-SQL query statement below */
SELECT P.name,
        COALESCE(SUM(I.rest),0) AS rest,
        COALESCE(SUM(I.paid),0) AS paid,
        COALESCE(SUM(I.canceled),0) AS canceled,
        COALESCE(SUM(I.refunded),0) AS refunded
FROM Product AS P
LEFT JOIN Invoice AS I
ON I.product_id = P.product_id
GROUP BY P.name
ORDER BY P.name