/* Write your T-SQL query statement below */
WITH home_team AS (
    SELECT 
    home_team_id AS team_id,
    COUNT(*) AS matches_played,
    SUM(CASE WHEN home_team_goals>away_team_goals THEN 3 WHEN home_team_goals=away_team_goals THEN 1 ELSE 0 END) AS points,
    SUM(home_team_goals) AS goal_for,
    SUM(away_team_goals) AS goal_against
FROM Matches
GROUP BY home_team_id
),
away_team AS (
    SELECT 
    away_team_id AS team_id,
    COUNT(*) AS matches_played,
    SUM(CASE WHEN away_team_goals>home_team_goals THEN 3 WHEN home_team_goals=away_team_goals THEN 1 ELSE 0 END) AS points,
    SUM(away_team_goals) AS goal_for,
    SUM(home_team_goals) AS goal_against
FROM Matches
GROUP BY away_team_id
), totals AS (
SELECT tt.team_name,
    SUM(ISNULL(matches_played,0)) AS matches_played,
    SUM(ISNULL(points,0)) AS points,
    SUM(ISNULL(goal_for,0)) AS goal_for,
    SUM(ISNULL(goal_against,0)) AS goal_against
  FROM Teams AS tt
  LEFT OUTER JOIN
  (SELECT * FROM home_team UNION ALL SELECT * FROM away_team) AS t
  ON t.team_id = tt.team_id
GROUP BY tt.team_name )

SELECT *, (goal_for-goal_against) AS goal_diff FROM totals 
WHERE matches_played > 0 
ORDER BY points DESC, (goal_for-goal_against) DESC, team_name 