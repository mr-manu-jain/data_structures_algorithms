/* Write your T-SQL query statement below */


SELECT C.country_name,
       CASE 
        WHEN AVG(weather_state*1.0) >= 25 THEN 'Hot'
        WHEN AVG(weather_state*1.0) <= 15 THEN 'Cold' 
        ELSE 'Warm'
        END AS weather_type
    FROM Weather LEFT OUTER JOIN Countries C
    ON Weather.country_id = C.country_id
    WHERE day BETWEEN '2019-11-01' AND '2019-11-30'
    GROUP BY C.country_name