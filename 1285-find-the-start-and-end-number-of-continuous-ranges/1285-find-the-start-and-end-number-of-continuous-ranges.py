import pandas as pd

def find_continuous_ranges(logs: pd.DataFrame) -> pd.DataFrame:
    # logs = logs.sort_values("log_id", ignore_index = True)
    return logs.groupby(logs.log_id - logs.index).agg(start_id=("log_id","min"), end_id=("log_id","max"))