import sqlite3
import pandas as pd
# Connect to SQLite database
conn = sqlite3.connect("database/customer_churn.db")

print("Database Connected Successfully!")

# SQL Query
query = """
SELECT
    contract,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY contract;
"""

# Load result into DataFrame
df = pd.read_sql(query, conn)

print(df)

# Parameterized Query
contract_type = "Month-to-month"

query = """
SELECT customerid,
       monthlycharges,
       tenure
FROM customer_churn
WHERE contract = ?;
"""

df = pd.read_sql(query, conn, params=(contract_type,))

print("\nCustomers with Month-to-month Contract:")
print(df.head())

# Close connection
conn.close()

print("Connection Closed.")