/* Write your T-SQL query statement below */
WITH first_install_dt AS (
    SELECT player_id,
    MIN(event_date) AS first_install_date
    FROM Activity
    GROUP BY player_id
),
install_counts AS (
    SELECT first_install_date AS install_dt,
    COUNT(DISTINCT player_id) AS installs
    FROM first_install_dt
    GROUP BY first_install_date
),
-- next_install_dates AS (
--     SELECT player_id,
--            event_date,
--            DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rnk
--     FROM Activity
-- ),
-- first_second AS (
--     SELECT player_id,
--            MAX(CASE WHEN rnk = 1 THEN event_date END) AS first_login,
--            MAX(CASE WHEN rnk = 2 THEN event_date END) AS second_login
--     FROM next_install_dates
--     GROUP BY player_id
-- )
first_second AS (
    SELECT f.player_id,
           f.first_install_date AS first_login,
           a.event_date AS second_login
    FROM first_install_dt f
    LEFT JOIN Activity a
      ON f.player_id = a.player_id
     AND a.event_date = DATEADD(day, 1, f.first_install_date)
)
SELECT ic.install_dt,
       ic.installs,
       ROUND(
           SUM(CASE WHEN DATEDIFF(day, fs.first_login, fs.second_login) = 1 THEN 1 ELSE 0 END) * 1.0 
           / ic.installs, 2
       ) AS Day1_retention
FROM install_counts ic
JOIN first_second fs ON ic.install_dt = fs.first_login
GROUP BY ic.install_dt, ic.installs
ORDER BY ic.install_dt;