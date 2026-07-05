/* Write your T-SQL query statement below */
SELECT ROUND(((COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)*100.0)/COUNT(*)),2) as immediate_percentage
FROM Delivery AS D1 WHERE order_date = (SELECT MIN(order_date) AS order_date FROM Delivery AS D2 WHERE D1.customer_id = D2.customer_id)