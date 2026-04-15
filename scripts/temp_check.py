import pandas as pd

b1 = pd.read_csv("data/batch_001/accounts.csv")
b2 = pd.read_csv("data/batch_002/accounts.csv")
b3 = pd.read_csv("data/batch_003/accounts.csv")

tracked = [1005, 1010, 1015]

print("BATCH 001")
print(b1[b1["account_id"].isin(tracked)][["account_id","collector_id","queue_name","current_balance"]])

print("BATCH 002")
print(b2[b2["account_id"].isin(tracked)][["account_id","collector_id","queue_name","current_balance"]])

print("BATCH 003")
print(b3[b3["account_id"].isin(tracked)][["account_id","collector_id","queue_name","current_balance"]])