# Purpose: Interactive customer segmentation explorer for marketers.

# Features

# Segment size distribution

# RFM comparison

# Campaign targeting recommendations

# app.py

import streamlit as st
import pandas as pd
from train_model import run_segmentation

st.title("🎯 Customer Segmentation for Targeted Marketing")

df, _, _ = run_segmentation()

segment = st.selectbox("Select Customer Segment", sorted(df["segment"].unique()))

segment_df = df[df["segment"] == segment]

st.metric("Customers in Segment", len(segment_df))
st.write("### Segment Profile")
st.dataframe(segment_df.describe())

st.write("### Recommended Actions")
if segment_df["monetary_total"].mean() > df["monetary_total"].mean():
    st.success("High-value customers → Loyalty & VIP offers")
else:
    st.info("Price-sensitive customers → Discounts & reactivation campaigns")
