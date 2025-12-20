# 🎯 Customer Segmentation for Targeted Marketing
## 📌 Project Overview

This project focuses on **customer segmentation using data analytics and machine learning** to help businesses deliver **personalized marketing campaigns**, improve **customer retention**, and increase **lifetime value (CLV)**.

Using transactional and behavioral data, customers are grouped into meaningful segments based on purchasing patterns, frequency, monetary value, and engagement behavior. The results are presented through **SQL-driven analytics, machine learning models, and Power BI dashboards** for actionable insights.

## 🎯 Business Objectives

- Identify high-value, loyal, and at-risk customers

- Enable targeted marketing and personalized promotions

- Improve campaign ROI and customer retention

- Support data-driven decision-making for marketing teams

## 🧠 Key Questions Answered

- Who are our most valuable customers?

- Which customers are likely to churn?

- How do purchasing behaviors differ across segments?

- Which segments should receive discounts, loyalty rewards, or re-engagement campaigns?

## 🗂️ Project Structure
```powershell
Customer_Segmentation_Targeted_Marketing/
│
├── data/
│   ├── raw/                # Raw customer & transaction data
│   └── processed/          # Cleaned & feature-engineered data
│
├── scripts/
│   ├── load_data.py        # Load datasets
│   ├── clean_data.py       # Data cleaning & preprocessing
│   ├── feature_engineering.py  # RFM metrics & behavioral features
│   ├── train_model.py      # Clustering models (KMeans, DBSCAN)
│   └── app.py              # Optional Streamlit app
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_cleaning.sql
│   ├── 03_rfm_segmentation.sql
│   ├── 04_metrics.sql
│   └── 05_views_for_powerbi.sql
│
├── dashboard/
│   └── PowerBI_Report_Spec.md
│
├── docs/
│   └── Workflow_Spec.md
│
├── requirements.txt
└── README.md
```
## 🧠 Analytical Approach

**1.Data Preparation**

- Clean raw customer transaction data

- Handle missing values and outliers

- Normalize behavioral metrics

**2.Feature Engineering**

- RFM metrics (Recency, Frequency, Monetary)

- Engagement scores

- Behavioral indicators

**3.Segmentation Modeling**

- KMeans clustering for customer grouping

- DBSCAN for density-based segmentation

- Cluster validation using silhouette score

**4.Insights & Visualization**

- Segment profiling

- Revenue contribution by segment

- Targeting recommendations

## 🔄 Workflow Summary
### 1️⃣ Data Ingestion

- Load customer profiles and transaction data from CSV or database

- Validate schema and data completeness

### 2️⃣ Data Cleaning

- Handle missing values and duplicates

- Normalize dates, monetary values, and identifiers

### 3️⃣ Feature Engineering

- RFM (Recency, Frequency, Monetary) metrics

- Average order value, purchase intervals

- Customer lifetime indicators

### 4️⃣ Customer Segmentation

- Rule-based RFM segmentation

- ML clustering (K-Means / DBSCAN)

- Segment labeling for business interpretation

### 5️⃣ Analytics & KPIs**

- Segment size and revenue contribution

- Churn risk indicators

- Campaign response readiness

### 6️⃣ Visualization & Insights

- Power BI dashboards for marketing teams

- Segment-level performance tracking

## 📊 Power BI Dashboard Overview
### 📄 Pages Included
### 1️⃣ Customer Segmentation Overview

- Total customers by segment

- Revenue contribution per segment

- Segment distribution trends

### 2️⃣ RFM Analysis

- Recency vs Frequency scatter plots

- Monetary value distribution

- High-value customer identification

### 3️⃣ Behavioral Insights

- Purchase frequency trends

- Average order value by segment

- Engagement patterns

### 4️⃣ Campaign Targeting

- Discount-sensitive segments

- Upsell & cross-sell opportunities

- Re-engagement targets

### 5️⃣ Churn Risk & Retention

- Low-engagement customers

- Early churn warning indicators

- Retention campaign prioritization

## 🧮 Sample Metrics & KPIs

- Customer Lifetime Value (CLV)

- Average Order Value (AOV)

- Repeat Purchase Rate

- Segment Revenue Share

- Churn Probability Score

## 🛠️ Tools & Technologies

- **SQL** – Data modeling, RFM analysis, metrics

- **Python** – pandas, scikit-learn, NumPy

- **Power BI** – Interactive dashboards & reporting

- **Streamlit** – Optional real-time segmentation app

- **Git/GitHub** – Version control & collaboration

## 📈 Business Impact

- Improved marketing personalization

- Higher campaign conversion rates

- Reduced customer churn

- Data-driven segmentation strategy

## 🚀 Future Enhancements

- Predictive churn modeling

- Real-time segmentation updates

- Integration with CRM / marketing automation tools

- A/B testing performance tracking

## 📬 Contact

This project is part of a professional data analytics portfolio.
For collaboration, feedback, or questions, feel free to reach out.

## 👤 Author
**Bahre Hailemariam**  
📍 *Data Analyst & BI Developer \| 4+ Years Experience*\
📩 [Email Adress](bahre.hail@gmail.com) | 🌐[Portfolio](https://bahre-hailemariam-data-analyst.crd.co/) |💼[LinkedIn](https://www.linkedin.com/in/bahre-hailemariam/) | 📊[GitHub](https://github.com/BahreHailemariam)


---

## 🪪 License
Licensed under the **MIT License** — free to use and modify.
