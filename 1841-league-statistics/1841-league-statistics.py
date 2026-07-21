import pandas as pd

def league_statistics(teams: pd.DataFrame, matches: pd.DataFrame) -> pd.DataFrame:
    home_df = matches.iloc[:,[0,2,3]]
    away_df = matches.iloc[:,[1,3,2]]

    home_df.columns = away_df.columns = ['team_id', 'goal_for', 'goal_against']

    df = pd.concat([home_df,away_df])
    df['goal_diff'] = df.goal_for - df.goal_against
    conditions = [df.goal_diff > 0, df.goal_diff ==0]
    choices = [3,1]
    df['points'] = np.select(conditions,choices,default=0)

    #df['points'] = (df.goal_diff >= 0) + 2 * (df.goal_diff > 0)
    df['matches_played'] = 1

    return (df.groupby('team_id', as_index = False).sum()
    .merge(teams)
    .sort_values(['points', 'goal_diff', 'team_name'], ascending = [0,0,1])
              [['team_name', 'matches_played', 'points', 'goal_for', 'goal_against', 'goal_diff']].dropna())