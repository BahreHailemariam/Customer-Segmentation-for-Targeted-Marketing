# Purpose: Perform customer segmentation using clustering models.

# Models Used

# KMeans (primary)

# DBSCAN (optional noise detection)

# Outputs

# Segment labels

# Cluster profiling

# Feature importance interpretation
# train_model.py

import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from feature_engineering import build_feature_table

def prepare_features(df):
    features = df[[
        "recency",
        "frequency",
        "monetary_total",
        "monetary_avg",
        "campaign_response_rate"
    ]]
    scaler = StandardScaler()
    scaled = scaler.fit_transform(features)
    return scaled, scaler

def train_kmeans(scaled_data, k=4):
    model = KMeans(n_clusters=k, random_state=42)
    clusters = model.fit_predict(scaled_data)
    return model, clusters

def run_segmentation():
    df = build_feature_table()
    scaled_data, scaler = prepare_features(df)

    model, clusters = train_kmeans(scaled_data)
    df["segment"] = clusters

    segment_profile = df.groupby("segment").mean()
    print(segment_profile)

    return df, model, scaler

if __name__ == "__main__":
    run_segmentation()
