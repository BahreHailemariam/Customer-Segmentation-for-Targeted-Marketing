#Purpose: Create RFM metrics, behavioral indicators, and campaign response features.

#Features Created

#Recency (days since last purchase)

#Frequency (number of transactions)

#Monetary value (total & average spend)

#Engagement rate

#Discount sensitivity

# feature_engineering.py

import pandas as pd
from datetime import datetime
from clean_data import clean_all

def compute_rfm(transactions):
    snapshot_date = transactions["transaction_date"].max() + pd.Timedelta(days=1)

    rfm = transactions.groupby("customer_id").agg({
        "transaction_date": lambda x: (snapshot_date - x.max()).days,
        "transaction_id": "count",
        "amount": ["sum", "mean"]
    })

    rfm.columns = ["recency", "frequency", "monetary_total", "monetary_avg"]
    rfm = rfm.reset_index()

    return rfm

def add_campaign_metrics(campaigns):
    campaign_metrics = campaigns.groupby("customer_id").agg({
        "response": "mean"
    }).reset_index().rename(columns={"response": "campaign_response_rate"})

    return campaign_metrics

def build_feature_table():
    customers, transactions, campaigns = clean_all()

    rfm = compute_rfm(transactions)
    campaign_metrics = add_campaign_metrics(campaigns)

    features = customers.merge(rfm, on="customer_id", how="left")
    features = features.merge(campaign_metrics, on="customer_id", how="left")

    features = features.fillna(0)
    return features

if __name__ == "__main__":
    df = build_feature_table()
    print(df.head())
