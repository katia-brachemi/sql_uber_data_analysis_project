# 📊 SQL Exploratory Data Analysis UBER Project

## Overview

This project showcases an **exploratory data analysis (EDA) workflow in SQL**.  
The objective is to query, structure, and interpret a relational dataset in order to highlight operational trends and customer behavior patterns.  

The dataset sourced from [Kaggle](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard/data), contains records of Uber rides during 2024.  
It provides visibility into booking activity, trip outcomes, payment preferences, cancellation dynamics, and overall service performance.

---

## 📂 Project Structure 
- **`int_database.sql`** → Table creation.
- **`loadtable.sql`** → Data loading.
- **`data_standardization.sql`** → Standardizes schema and column naming conventions for consistency across datasets.
- **`data_analysis.sql`** → Exploratory SQL queries for operational and customer insights.
- **`Tableau Dashboard`** → Visual KPIs and charts built from SQL outputs.

## 🔑 Key Queries
- Longest customer waiting time  
- Most common cancellation reasons (with percentages)  
- Highest booking value  
- Payment method usage frequency  
- Top 5 most frequent routes  
- Overall performance metrics (totals and percentages)


## Tableau Dashboard

After cleaning and analyzing the Uber booking dataset with SQL, I built an interactive Tableau dashboard to visualize key insights.
- **KPIs**: Total Revenue, % Completed, % Cancelled
- **Trend Analysis**: Bookings Count trend over months
- **Customer Behavior**: Ratings by vehicle type, cancellation reasons
- **Revenue Insights**: Payment method distribution

📊 [View the interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/katia.brachemi/viz/Uber_17708919274750/Dashboard1).

### Dashboard Preview
![Dashboard Overview](visualizations/dashboard_overview.png).
![Bookings Trend](visualizations/bookings_trend.png).
![Customer Ratings](visualizations/customer_ratings.png).
![Cancellation Reasons](visualizations/cancellation_reasons.png).
![Payment Methods](visualizations/payment_methods.png).


## 🛠️ Tools & Technologies
- **SQL Server (T‑SQL)** → Data preparation and analysis  
- **Tableau** → KPI visualization and dashboards  
- **GitHub** → Project documentation and version control

 
 ---
## License
This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
