WITH product_sales AS (
    SELECT DISTINCT A.buyer_id,
                    SUM(CASE WHEN B.product_name = 'S8' THEN 1 ELSE 0 END) AS S8_Sales,
                    SUM(CASE WHEN B.product_name = 'iPhone' THEN 1 ELSE 0 END) AS iPhone_Sales
    FROM Sales AS A
    LEFT OUTER JOIN Product AS B
    ON A.product_id = B.product_id
    GROUP BY A.buyer_id
)

SELECT buyer_id FROM product_sales
WHERE S8_Sales > 0 AND iPhone_Sales = 0