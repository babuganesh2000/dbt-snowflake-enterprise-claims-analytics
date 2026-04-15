from __future__ import annotations
import random
from datetime import datetime, timedelta
from pathlib import Path

import pandas as pd
from faker import Faker

fake = Faker()
random.seed(42)

BASE_DIR = Path(__file__).resolve().parents[1]
DATA_DIR = BASE_DIR / "data"
DATA_DIR.mkdir(parents=True, exist_ok=True)

today = datetime.today()

def rand_dt(days_back: int) -> datetime:
    return today - timedelta(days=random.randint(0, days_back))

NUM_CLAIMS = 12000
NUM_REMITS = 15000

claims = pd.DataFrame([
    {
        "claim_id": i,
        "account_id": random.randint(1, 4000),
        "facility_id": random.randint(1, 8),
        "payer_id": random.randint(1, 15),
        "service_date": rand_dt(365).date(),
        "billed_amount": round(random.uniform(100, 30000), 2),
        "claim_status": random.choice(["OPEN", "PAID", "DENIED", "PENDING"]),
        "load_ts": rand_dt(30),
        "batch_id": random.randint(1000, 1100),
        "src_file_name": "claims.csv",
    }
    for i in range(1, NUM_CLAIMS + 1)
])

remits = pd.DataFrame([
    {
        "remit_id": i,
        "claim_id": random.randint(1, NUM_CLAIMS),
        "payment_date": rand_dt(365).date(),
        "paid_amount": round(random.uniform(0, 18000), 2),
        "adjustment_amount": round(random.uniform(0, 5000), 2),
        "carc_code": random.choice(["45", "96", "197", "29", "B7", ""]),
        "rarc_code": random.choice(["N115", "M15", "N130", "MA01", ""]),
        "remit_status": random.choice(["POSTED", "PENDING", "REVERSED"]),
        "load_ts": rand_dt(30),
        "batch_id": random.randint(2000, 2100),
        "src_file_name": "remittances.csv",
    }
    for i in range(1, NUM_REMITS + 1)
])

accounts = pd.DataFrame([
    {
        "account_id": i,
        "patient_id": 100000 + i,
        "facility_id": random.randint(1, 8),
        "current_balance": round(random.uniform(50, 25000), 2),
        "assignment_status": random.choice(["Assigned", "Unassigned", "Escalated"]),
        "collector_id": random.randint(1, 20),
        "queue_name": random.choice(["Early Out", "Denials", "Follow Up", "High Balance"]),
        "updated_at": rand_dt(180),
        "load_ts": rand_dt(30),
    }
    for i in range(1, 4001)
])

collectors = pd.DataFrame([
    {
        "collector_id": i,
        "collector_name": fake.name(),
        "manager_name": fake.name(),
        "region": random.choice(["East", "Central", "West"]),
        "active_flag": random.choice(["Y", "Y", "Y", "N"]),
    }
    for i in range(1, 21)
])

payers = pd.DataFrame([
    {
        "payer_id": i,
        "payer_name": f"{fake.company()} Health",
        "payer_category": random.choice(["Commercial", "Medicare", "Medicaid", "Self Pay"]),
        "contract_type": random.choice(["Standard", "Value-Based", "Capitated"]),
    }
    for i in range(1, 16)
])

facilities = pd.DataFrame([
    {
        "facility_id": i,
        "facility_name": f"{fake.city()} Medical Center",
        "state": fake.state_abbr(),
        "region": random.choice(["East", "Central", "West"]),
    }
    for i in range(1, 9)
])

actions = pd.DataFrame([
    {
        "action_id": i,
        "account_id": random.randint(1, 4000),
        "collector_id": random.randint(1, 20),
        "action_date": rand_dt(120).date(),
        "action_type": random.choice(["CALL", "NOTE", "REVIEW", "ESCALATE"]),
        "note_count": random.randint(0, 4),
        "worked_flag": random.choice(["Y", "N"]),
    }
    for i in range(1, 20001)
])

claims.to_csv(DATA_DIR / "claims.csv", index=False)
remits.to_csv(DATA_DIR / "remittances.csv", index=False)
accounts.to_csv(DATA_DIR / "accounts.csv", index=False)
collectors.to_csv(DATA_DIR / "collectors.csv", index=False)
payers.to_csv(DATA_DIR / "payers.csv", index=False)
facilities.to_csv(DATA_DIR / "facilities.csv", index=False)
actions.to_csv(DATA_DIR / "workqueue_actions.csv", index=False)

print("Synthetic data files generated under ./data")
