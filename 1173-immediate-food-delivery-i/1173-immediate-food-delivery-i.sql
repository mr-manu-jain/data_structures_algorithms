/* Write your T-SQL query statement below */


SELECT ROUND(((COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)*1.0)/COUNT(*))*100,2) as immediate_percentage
FROM Delivery