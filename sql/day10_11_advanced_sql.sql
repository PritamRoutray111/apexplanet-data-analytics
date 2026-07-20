-- Count Total Customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;

-- Total Revenue
SELECT SUM(totalcharges) AS total_revenue
FROM customer_churn;

-- Average Monthly Charge
SELECT AVG(monthlycharges) AS avg_monthly_charge
FROM customer_churn;

-- Highest Monthly Charge
SELECT MAX(monthlycharges) AS highest_monthly_charge
FROM customer_churn;

-- Lowest Monthly Charge
SELECT MIN(monthlycharges) AS lowest_monthly_charge
FROM customer_churn;

-- Customers by Gender
SELECT gender,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY gender;

-- Customers by Contract
SELECT contract,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY contract;

-- Average Charges by Contract
SELECT contract,
AVG(monthlycharges) AS avg_charge
FROM customer_churn
GROUP BY contract;

-- Churn Count
SELECT churn,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY churn;


-- Contracts having more than 1000 customers
SELECT contract,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY contract
HAVING COUNT(*) > 1000;

-- Internet services with average charge above 50
SELECT internetservice,
AVG(monthlycharges) AS avg_charge
FROM customer_churn
GROUP BY internetservice
HAVING AVG(monthlycharges) > 50;


WITH avg_charge AS
(
SELECT AVG(monthlycharges) AS avg_monthly
FROM customer_churn
)

SELECT customerid,
monthlycharges
FROM customer_churn,
avg_charge
WHERE monthlycharges > avg_monthly;

SELECT customerid,
monthlycharges,
ROW_NUMBER() OVER(ORDER BY monthlycharges DESC) AS row_num
FROM customer_churn;

SELECT customerid,
monthlycharges,
RANK() OVER(ORDER BY monthlycharges DESC) AS rank_num
FROM customer_churn;

SELECT customerid,
tenure,
LAG(tenure) OVER(ORDER BY tenure) AS previous_tenure
FROM customer_churn;


SELECT customerid,
tenure,
LEAD(tenure) OVER(ORDER BY tenure) AS next_tenure
FROM customer_churn;

