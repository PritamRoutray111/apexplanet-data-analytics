 # ApexPlanet Data Analytics Internship
 
 # IBM Telco Customer Churn Analysis

## 📌 Project Overview

This project analyzes customer churn using the IBM Telco Customer Churn dataset.

The objective is to identify factors associated with customer churn, segment customers based on their characteristics, build predictive models, and present the findings through visualizations and an interactive Power BI dashboard.

## 🎯 Objectives

- Clean and preprocess customer data
- Perform exploratory data analysis
- Perform SQL-based analysis
- Create business-focused visualizations
- Perform statistical analysis
- Segment customers using K-Means clustering
- Build churn prediction models
- Evaluate machine learning models
- Create an interactive Power BI dashboard
- Provide actionable business recommendations

## 📊 Dataset

**Dataset:** IBM Telco Customer Churn

- Records: 7,043
- Features: 21
- Target variable: `churn`

The dataset contains information about customer demographics, services, contracts, tenure, monthly charges, total charges and churn status.

## 🛠️ Technologies Used

- Python
- Pandas
- NumPy
- SciPy
- Scikit-learn
- Matplotlib
- Seaborn
- SQL
- Jupyter Notebook
- Power BI

## 🔍 Analysis Performed

### 1. Data Cleaning
- Standardized column names
- Converted `totalcharges` to numeric
- Handled missing values
- Removed duplicate records
- Created a cleaned dataset

### 2. Exploratory Data Analysis

Analyzed:

- Customer churn distribution
- Contract types
- Tenure
- Monthly charges
- Total charges
- Customer services
- Correlations between numerical variables

### 3. Statistical Analysis

Performed:

- Descriptive statistics
- 95% confidence interval
- Independent samples t-test
- Chi-square test
- ANOVA
- Correlation analysis

### 4. Customer Segmentation

Used:

- StandardScaler
- K-Means clustering
- Elbow method
- Silhouette score
- PCA visualization

### 5. Predictive Modeling

Machine learning models:

- Logistic Regression
- Decision Tree

Evaluation metrics:

- Accuracy
- Precision
- Recall
- F1-Score
- ROC-AUC

### 6. Power BI Dashboard

An interactive dashboard was created to explore:

- Customer churn
- Customer characteristics
- Contract patterns
- Churn-related insights
- Customer-level information

## 📈 Key Finding

The overall customer churn rate in the dataset is:

**26.54%**

The analysis indicates that factors such as contract type, tenure and monthly charges are important areas for understanding customer churn.

## 💡 Business Recommendations

- Focus retention campaigns on month-to-month customers
- Monitor customers with high monthly charges
- Improve onboarding for new customers
- Use customer segmentation for personalized retention strategies
- Use churn prediction as decision support for retention teams

## 📁 Project Structure

```text
apexplanet-data-analytics/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── dashboards/
│   └── IBM_Telco_Customer_Churn_Dashboard.pbix
│
├── notebooks/
│
├── reports/
│
├── scripts/
│   ├── db_utils.py
│   ├── sql_analysis.py
│   └── analytics_pipeline.py
│
├── sql/
│
└── README.md