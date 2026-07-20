-- ==========================================
-- Day 12-14 : Advanced SQL Business Analysis
-- IBM Telco Customer Churn Dataset
-- ==========================================


-- 1. Total Customers, Churned Customers & Churn Rate

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;



-- 2. Revenue by Contract Type

SELECT
    contract,
    ROUND(SUM(totalcharges), 2) AS revenue
FROM customer_churn
GROUP BY contract
ORDER BY revenue DESC;



-- 3. Average Monthly Charges by Internet Service

SELECT
    internetservice,
    ROUND(AVG(monthlycharges), 2) AS avg_monthly_charge
FROM customer_churn
GROUP BY internetservice;



-- 4. Churn Analysis by Contract Type

SELECT
    contract,
    churn,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY contract, churn;



-- 5. Top 10 Highest Paying Customers

SELECT
    customerid,
    monthlycharges
FROM customer_churn
ORDER BY monthlycharges DESC
LIMIT 10;



-- 6. Average Customer Tenure

SELECT
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM customer_churn;



-- 7. Senior Citizen Distribution

SELECT
    seniorcitizen,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY seniorcitizen;



-- 8. Payment Method Distribution

SELECT
    paymentmethod,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY paymentmethod
ORDER BY customers DESC;



-- 9. Churn by Payment Method

SELECT
    paymentmethod,
    churn,
    COUNT(*) AS customers
FROM customer_churn
GROUP BY paymentmethod, churn;



-- 10. Contract-wise Average Monthly Charges

SELECT
    contract,
    ROUND(AVG(monthlycharges), 2) AS average_monthly_charge
FROM customer_churn
GROUP BY contract;



-- 11. Revenue by Internet Service

SELECT
    internetservice,
    ROUND(SUM(totalcharges), 2) AS total_revenue
FROM customer_churn
GROUP BY internetservice
ORDER BY total_revenue DESC;



-- 12. Customer Count by Internet Service

SELECT
    internetservice,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY internetservice;



-- 13. Average Monthly Charges by Payment Method

SELECT
    paymentmethod,
    ROUND(AVG(monthlycharges), 2) AS avg_monthly_charge
FROM customer_churn
GROUP BY paymentmethod;



-- 14. Customers with Tenure Greater Than Average

SELECT
    customerid,
    tenure
FROM customer_churn
WHERE tenure >
(
    SELECT AVG(tenure)
    FROM customer_churn
);



-- 15. Customers Paying More Than Average Monthly Charges

SELECT
    customerid,
    monthlycharges
FROM customer_churn
WHERE monthlycharges >
(
    SELECT AVG(monthlycharges)
    FROM customer_churn
);



-- 16. Create a View for Churned Customers

CREATE VIEW IF NOT EXISTS churned_customers AS
SELECT *
FROM customer_churn
WHERE churn = 'Yes';



-- 17. View the Churned Customers

SELECT *
FROM churned_customers
LIMIT 10;



-- 18. Query Execution Plan

EXPLAIN QUERY PLAN
SELECT *
FROM customer_churn
WHERE churn = 'Yes';