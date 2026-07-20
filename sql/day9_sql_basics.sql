-- Day 9 SQL Basics

SELECT * FROM customer_churn;

SELECT customerid, gender, tenure, monthlycharges, churn
FROM customer_churn;

SELECT customerid, gender, contract, monthlycharges
FROM customer_churn
WHERE churn='Yes';

SELECT customerid, monthlycharges
FROM customer_churn
ORDER BY monthlycharges DESC;

SELECT customerid, monthlycharges
FROM customer_churn
ORDER BY monthlycharges DESC
LIMIT 10;
