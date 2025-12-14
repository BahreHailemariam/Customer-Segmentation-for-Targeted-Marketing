/* ============================================
   04 — MARKETING METRICS
   ============================================ */

-- Segment size and revenue contribution
CREATE OR REPLACE VIEW kpi_segment_summary AS
SELECT
    segment_label,
    COUNT(customer_id) AS customer_count,
    SUM(monetary_value) AS total_revenue,
    AVG(monetary_value) AS avg_customer_value
FROM rfm_features
GROUP BY segment_label;

-- Customer lifetime proxy
CREATE OR REPLACE VIEW kpi_customer_lifetime_value AS
SELECT
    customer_id,
    monetary_value / NULLIF(recency_days, 0) AS value_velocity
FROM rfm_features;

-- Purchase frequency distribution
CREATE OR REPLACE VIEW kpi_frequency_distribution AS
SELECT
    frequency,
    COUNT(customer_id) AS customers
FROM rfm_features
GROUP BY frequency;
