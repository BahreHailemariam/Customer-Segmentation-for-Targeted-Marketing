
# Purpose: Load customer, transaction, and campaign datasets; validate schema.

# Responsibilities

# Load CSV or database extracts

# Parse dates

# Basic data profiling

# Centralized I/O logic
# load_data.py

import pandas as pd
from pathlib import Path

DATA_DIR = Path("../data/raw")

def load_customers():
    return pd.read_csv(DATA_DIR / "customers.csv")

def load_transactions():
    return pd.read_csv(
        DATA_DIR / "transactions.csv",
        parse_dates=["transaction_date"]
    )

def load_campaigns():
    return pd.read_csv(DATA_DIR / "campaigns.csv")

def load_all():
    customers = load_customers()
    transactions = load_transactions()
    campaigns = load_campaigns()

    print("Loaded datasets: - load_data.py:37")
    print("Customers: - load_data.py:38", customers.shape)
    print("Transactions: - load_data.py:39", transactions.shape)
    print("Campaigns: - load_data.py:40", campaigns.shape)

    return customers, transactions, campaigns

if __name__ == "__main__":
    load_all()
