# Purpose: Clean inconsistencies, missing values, outliers, and invalid records.

# Key Cleaning Steps

# Remove duplicate customers

# Fix negative transaction values

# Standardize categorical columns

# Handle missing demographics
# clean_data.py

import pandas as pd
from load_data import load_all

def clean_customers(df):
    df = df.drop_duplicates(subset="customer_id")
    df["gender"] = df["gender"].str.lower().fillna("unknown")
    df["age"] = df["age"].fillna(df["age"].median())
    return df

def clean_transactions(df):
    df = df[df["amount"] > 0]
    df["channel"] = df["channel"].str.lower()
    return df

def clean_campaigns(df):
    df["response"] = df["response"].fillna(0)
    return df

def clean_all():
    customers, transactions, campaigns = load_all()

    customers = clean_customers(customers)
    transactions = clean_transactions(transactions)
    campaigns = clean_campaigns(campaigns)

    return customers, transactions, campaigns

if __name__ == "__main__":
    clean_all()
