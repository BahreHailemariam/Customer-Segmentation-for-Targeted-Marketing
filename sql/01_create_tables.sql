/* ============================================
   01 — CREATE TABLES
   Customer Segmentation for Targeted Marketing
   ============================================ */

-- =========================
-- CUSTOMER DIMENSION
-- =========================
CREATE TABLE dim_customers (
    customer_id        INT PRIMARY KEY,
    signup_date        DATE,
    gender             VARCHAR(10),
    age                INT,
    country            VARCHAR(50),
    acquisition_channel VARCHAR(50)
);

-- =========================
-- TRANSACTIONS FACT TABLE
-- =========================
CREATE TABLE fact_transactions (
    transaction_id     INT PRIMARY KEY,
    customer_id        INT,
    transaction_date   DATE,
    order_value        NUMERIC(12,2),
    product_category   VARCHAR(50),
    payment_method     VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

-- =========================
-- RFM FEATURE STORE
-- =========================
CREATE TABLE rfm_features (
    customer_id     INT PRIMARY KEY,
    recency_days    INT,
    frequency       INT,
    monetary_value  NUMERIC(14,2),
    r_score         INT,
    f_score         INT,
    m_score         INT,
    rfm_score       VARCHAR(3),
    segment_label   VARCHAR(50)
);
