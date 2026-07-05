WITH CTE AS (SELECT business_id,
    event_type,
    occurrences,
    AVG(occurrences) OVER(PARTITION BY event_type) AS avg
    FROM Events
)

SELECT business_id
FROM CTE
WHERE occurrences > avg
GROUP BY business_id
HAVING COUNT(*) > 1

-- /* Write your T-SQL query statement below */
-- WITH averages AS (
--     SELECT event_type,
--            ROUND(SUM(occurrences)*1.0/COUNT(business_id),1) AS avg_activity
--     FROM Events
--     GROUP BY event_type
-- ),
-- business_averages AS (
--     SELECT business_id,
--     COUNT(*) AS cnt
--     FROM Events
--     LEFT OUTER JOIN averages 
--     ON Events.event_type = averages.event_type
--     WHERE Events.occurrences > avg_activity
--     GROUP BY business_id
--     HAVING COUNT(*) > 1
-- )

-- SELECT business_id FROM business_averages