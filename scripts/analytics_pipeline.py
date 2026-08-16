from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt


# =========================
# PATHS
# =========================

BASE_DIR = Path(__file__).resolve().parent.parent

RAW_DATA = BASE_DIR / "data" / "raw" / "Telco-Customer-Churn.csv"
CLEANED_DIR = BASE_DIR / "data" / "cleaned"
REPORTS_DIR = BASE_DIR / "reports"

CLEANED_FILE = CLEANED_DIR / "Telco-Customer-Churn-Cleaned.csv"


# Create output folders if they don't exist
CLEANED_DIR.mkdir(parents=True, exist_ok=True)
REPORTS_DIR.mkdir(parents=True, exist_ok=True)


# =========================
# 1. LOAD DATA
# =========================

print("Loading dataset...")

df = pd.read_csv(RAW_DATA)

print(f"Dataset loaded successfully: {df.shape[0]} rows, {df.shape[1]} columns")


# =========================
# 2. CLEAN COLUMN NAMES
# =========================

df.columns = df.columns.str.strip().str.lower()


# =========================
# 3. CLEAN TOTAL CHARGES
# =========================

df["totalcharges"] = pd.to_numeric(
    df["totalcharges"],
    errors="coerce"
)

# Fill missing TotalCharges with median
df["totalcharges"] = df["totalcharges"].fillna(
    df["totalcharges"].median()
)


# =========================
# 4. REMOVE DUPLICATES
# =========================

df = df.drop_duplicates()


# =========================
# 5. SAVE CLEANED DATA
# =========================

df.to_csv(CLEANED_FILE, index=False)

print(f"Cleaned dataset saved to: {CLEANED_FILE}")


# =========================
# 6. BASIC ANALYSIS
# =========================

print("\n--- Dataset Information ---")

print("Rows:", len(df))
print("Columns:", len(df.columns))

print("\nChurn Distribution:")

print(df["churn"].value_counts())


# =========================
# 7. CHURN RATE
# =========================

churn_rate = (
    df["churn"]
    .value_counts(normalize=True)
    .get("Yes", 0) * 100
)

print(f"\nOverall Churn Rate: {churn_rate:.2f}%")


# =========================
# 8. BASIC VISUALIZATION
# =========================

plt.figure(figsize=(7, 5))

df["churn"].value_counts().plot(
    kind="bar"
)

plt.title("Customer Churn Distribution")
plt.xlabel("Churn")
plt.ylabel("Number of Customers")

plt.tight_layout()

chart_path = REPORTS_DIR / "churn_distribution.png"

plt.savefig(chart_path, dpi=300)

plt.close()

print(f"Visualization saved to: {chart_path}")


# =========================
# PIPELINE COMPLETE
# =========================

# =========================
# 9. EXPORT KPI RESULTS
# =========================

total_customers = len(df)

churned_customers = (
    df["churn"]
    .value_counts()
    .get("Yes", 0)
)

churn_rate = (churned_customers / total_customers) * 100

average_monthly_charges = df["monthlycharges"].mean()
average_tenure = df["tenure"].mean()

kpi_results = pd.DataFrame({
    "KPI": [
        "Total Customers",
        "Churned Customers",
        "Churn Rate (%)",
        "Average Monthly Charges",
        "Average Tenure"
    ],
    "Value": [
        total_customers,
        churned_customers,
        round(churn_rate, 2),
        round(average_monthly_charges, 2),
        round(average_tenure, 2)
    ]
})

kpi_file = REPORTS_DIR / "analytics_results.csv"

kpi_results.to_csv(kpi_file, index=False)

print(f"KPI results exported to: {kpi_file}")

print("\n================================")
print("Analytics Pipeline Completed!")
print("================================")