/* ============================================
   03 — RFM SEGMENTATION
   ============================================ */

WITH rfm_base AS (
    SELECT
        customer_id,
        MAX(transaction_date) AS last_purchase_date,
        COUNT(transaction_id) AS frequency,
        SUM(order_value) AS monetary_value
    FROM fact_transactions
    GROUP BY customer_id
),
rfm_calculated AS (
    SELECT
        customer_id,
        DATE_PART('day', CURRENT_DATE - last_purchase_date) AS recency_days,
        frequency,
        monetary_value
    FROM rfm_base
),
rfm_scores AS (
    SELECT
        customer_id,
        recency_days,
        frequency,
        monetary_value,
        NTILE(5) OVER (ORDER BY recency_days ASC)     AS r_score,
        NTILE(5) OVER (ORDER BY frequency DESC)       AS f_score,
        NTILE(5) OVER (ORDER BY monetary_value DESC)  AS m_score
    FROM rfm_calculated
)
INSERT INTO rfm_features
SELECT
    customer_id,
    recency_days,
    frequency,
    monetary_value,
    r_score,
    f_score,
    m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_score,
    CASE
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal Customers'
        WHEN r_score >= 4 AND f_score <= 2 THEN 'New Customers'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score = 1 THEN 'Lost Customers'
        ELSE 'Needs Attention'
    END AS segment_label
FROM rfm_scores;
