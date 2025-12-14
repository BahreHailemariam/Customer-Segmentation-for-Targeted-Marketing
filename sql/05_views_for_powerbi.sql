/* ============================================
   05 — POWER BI VIEWS
   ============================================ */

-- Master segmentation dataset
CREATE OR REPLACE VIEW vw_customer_segmentation AS
SELECT
    c.customer_id,
    c.gender,
    c.age,
    c.country,
    c.acquisition_channel,
    r.recency_days,
    r.frequency,
    r.monetary_value,
    r.rfm_score,
    r.segment_label
FROM dim_customers c
JOIN rfm_features r USING(customer_id);

-- Segment trends
CREATE OR REPLACE VIEW vw_segment_trends AS
SELECT
    segment_label,
    COUNT(customer_id) AS customers,
    AVG(recency_days) AS avg_recency,
    AVG(frequency) AS avg_frequency,
    AVG(monetary_value) AS avg_spend
FROM rfm_features
GROUP BY segment_label;

-- Campaign targeting list
CREATE OR REPLACE VIEW vw_campaign_targets AS
SELECT
    customer_id,
    segment_label,
    monetary_value
FROM rfm_features
WHERE segment_label IN ('Champions', 'Loyal Customers', 'At Risk');
