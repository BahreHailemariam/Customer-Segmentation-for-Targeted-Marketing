/* ============================================
   02 — DATA CLEANING
   ============================================ */

-- Remove invalid transactions
DELETE FROM fact_transactions
WHERE order_value <= 0
   OR transaction_date IS NULL;

-- Standardize product category naming
UPDATE fact_transactions
SET product_category = LOWER(TRIM(product_category));

-- Handle missing gender values
UPDATE dim_customers
SET gender = 'unknown'
WHERE gender IS NULL;

-- Remove duplicate transactions
DELETE FROM fact_transactions
WHERE transaction_id IN (
    SELECT transaction_id
    FROM (
        SELECT transaction_id,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY transaction_date) rn
        FROM fact_transactions
    ) t
    WHERE rn > 1
);
