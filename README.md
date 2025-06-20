# Walmart-Sales-Data-Analysis

# 🛒 Walmart Sales Data Analysis

This project performs end-to-end data analysis on a 10,000-record dataset of Walmart sales using Python, Pandas, MySQL, and SQL analytical queries. The aim is to uncover meaningful business insights such as sales trends, customer preferences, and branch-level performance.

---

## 📌 Dataset Overview

- **Source**: [Kaggle](https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)
- **Records**: 10,000+
- **Columns**: `invoice_id`, `branch`, `city`, `category`, `unit_price`, `quantity`, `date`, `time`, `payment_method`, `rating`, `profit_margin`, `total_price`

---

## 🧰 Tools Used

- **IDE**: VS Code
- **Languages**: Python, SQL
- **Libraries**: `pandas`, `sqlalchemy`, `pymysql`
- **Database**: MySQL
- **Environment**: Virtual Environment (`venv`)

---

## 🔄 Process Flow

1. **Data Import**:
   - Dataset imported from Kaggle using Kaggle API into VS Code.

2. **Data Cleaning & Preprocessing**:
   - Cleaned messy data using Pandas.
   - Converted text-based `date` and `time` columns into proper formats.

3. **Data Loading**:
   - Connected to MySQL using SQLAlchemy and PyMySQL.
   - Uploaded the cleaned dataset to `walmart_db`.

4. **Exploratory Data Analysis (EDA)**:
   - Conducted using SQL queries directly in MySQL.

## 📊 Business Questions & Insights
------------------------------------------------
📌 Key Insights from Walmart Sales Data
💳 E-wallets were the most commonly used payment method across all branches.

🏬 Different branches had different top-performing categories based on customer ratings.

📅 Fridays and Saturdays were the busiest days for most branches in terms of transaction count.

📦 E-wallet users purchased more quantity on average than cash or card users.

🌆 Product ratings varied significantly by city and category, indicating regional preferences.

💰 "Health and Beauty" and "Home and Lifestyle" categories generated the highest profits.

🏦 Each branch had a preferred payment method, showing regional trends in digital vs. cash usage.

🕒 Most invoices were generated in the Afternoon, followed by Evening and Morning shifts.

📉 Some branches experienced a notable drop in revenue from 2022 to 2023, highlighting the need for performance review.


