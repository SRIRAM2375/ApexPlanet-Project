# ApexPlanet Data Analytics Internship  Task 1

## Task 1 - Foundational Setup & Exploratory Data Analysis (EDA)

This repository contains my work for **Task 1 of the Data Analytics Internship at ApexPlanet Software Pvt. Ltd.**

The objective of this task is to set up the data analytics environment, clean and prepare a dataset, perform Exploratory Data Analysis (EDA), create meaningful visualizations, and identify important business insights.

---

## Objective

The main objectives of this task are:

- Set up the Python data analytics environment.
- Load and understand the dataset.
- Identify and handle missing values and duplicate records.
- Convert columns to appropriate data types.
- Detect potential outliers using the IQR method.
- Perform Exploratory Data Analysis (EDA).
- Create meaningful data visualizations.
- Identify key insights from the data.
- Save the cleaned dataset for further analysis.

---

## Dataset

The **Superstore Sales dataset** was used for this project.

The dataset contains information about customer orders, products, sales, discounts, quantities, and profits.

### Dataset Size

- **Rows:** 10,194
- **Columns:** 21

### Important Columns

- Order Date
- Ship Date
- Ship Mode
- Customer Name
- Segment
- Country/Region
- State/Province
- Region
- Category
- Sub-Category
- Product Name
- Sales
- Quantity
- Discount
- Profit

---

## Tools and Technologies

The following tools and Python libraries were used:

- Python
- Visual Studio Code
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn

---

## Data Cleaning

The following data-cleaning operations were performed:

### Missing Values

The dataset was checked for missing values.

**Result:** No missing values were found.

### Duplicate Records

Duplicate rows were checked using Pandas.

**Result:** No duplicate records were found.

### Data Type Conversion

The `Order Date` and `Ship Date` columns were converted from object/string format to Python datetime format.

Additional checks were performed to identify invalid dates and shipping dates occurring before order dates.

### Outlier Detection

Potential outliers were detected using the **Interquartile Range (IQR) method** for:

- Sales
- Quantity
- Discount
- Profit

The IQR analysis identified statistical outliers. However, these records were retained because they may represent valid business transactions such as large orders, high discounts, and unusually high profits or losses.

After cleaning, the dataset contained:

**10,194 rows and 21 columns.**

The cleaned dataset was saved as:

`data/cleaned_superstore_sales.csv`

---

## Exploratory Data Analysis

Several exploratory analyses and visualizations were performed.

### Sales Distribution

A histogram was used to analyze the distribution of Sales.

The analysis showed that Sales are highly right-skewed. Most transactions have relatively low sales values, while a smaller number of transactions have very high sales values.

### Sales Boxplot

A boxplot was created to identify the distribution and potential outliers in Sales.

### Sales by Category

Total sales were compared across product categories.

| Category | Total Sales |
| --- | ---: |
| Technology | $839,893.28 |
| Furniture | $754,747.76 |
| Office Supplies | $731,893.31 |

Technology generated the highest total sales.

### Profit by Category

Profit was also compared across categories.

| Category | Total Profit |
| --- | ---: |
| Technology | $146,543.38 |
| Office Supplies | $126,023.44 |
| Furniture | $19,730.00 |

Technology generated the highest total profit.

Furniture generated substantial sales but significantly lower profit compared with the other categories.

### Correlation Analysis

A correlation heatmap was created for:

- Sales
- Quantity
- Discount
- Profit

Important correlations observed:

- Sales and Profit: **0.48**
- Discount and Profit: **-0.22**

Sales and Profit showed a moderate positive relationship, while Discount and Profit showed a negative relationship.

### Monthly Sales Trend

Monthly sales were analyzed using a line chart.

- **Highest monthly sales:** November 2026 – $118,454.51
- **Lowest monthly sales:** February 2023 – $4,519.89

The analysis showed noticeable month-to-month fluctuations in sales.

### Profit by Sub-Category

Profitability was analyzed across product sub-categories.

- **Highest-profit sub-category:** Copiers – $56,093.94
- **Lowest-profit sub-category:** Tables – -$17,753.21

Tables recorded a significant overall loss.

---

## Key Insights

1. **Technology generated the highest total sales**, with approximately $839,893 in sales.

2. **Technology was also the most profitable category**, generating approximately $146,543 in profit, while Furniture generated only around $19,730 despite substantial sales.

3. **Sales and Profit showed a moderate positive correlation of 0.48**, while Discount and Profit showed a negative correlation of -0.22.

4. **Monthly sales fluctuated significantly over time.** November 2026 recorded the highest monthly sales at approximately $118,454, while February 2023 recorded the lowest at approximately $4,520.

5. **Copiers were the most profitable sub-category**, generating approximately $56,094 in profit, while Tables were the least profitable, with a loss of approximately $17,753.

---

## Project Structure

```text
APEX-Task1/
│
├── data/
│   ├── sample_-_superstore.xls
│   ├── superstore_sales.csv
│   └── cleaned_superstore_sales.csv
│
├── notebooks/
│   └── task1_eda.ipynb
│
├── scripts/
│   └── convert_xls_to_csv.py
│
├── reports/
│
├── dashboards/
│
└── README.md



## Task 2 — SQL for Data Extraction and Analysis

### Overview

Task 2 focuses on extracting, transforming, and analyzing Superstore sales data using SQL and Python. The cleaned dataset from Task 1 is loaded into a SQLite database and analyzed using SQL queries.

### Objectives

* Store the cleaned Superstore dataset in a SQLite database.
* Perform SQL-based data extraction and analysis.
* Use advanced SQL techniques for business analysis.
* Connect Python with SQLite using SQLAlchemy.
* Answer business questions using SQL queries.
* Create reusable database utilities.

### Dataset

The analysis uses the cleaned Superstore sales dataset created during Task 1.

**Dataset:** `data/cleaned_superstore_sales.csv`

The SQLite database contains:

* **Rows:** 10,194
* **Columns:** 21
* **Main table:** `sales`

### Technologies Used

* Python
* Pandas
* SQL
* SQLite
* SQLAlchemy
* Jupyter Notebook
* VS Code

### Project Structure

```text
APEX-Task1/
│
├── dashboard/
│
├── data/
│   ├── cleaned_superstore_sales.csv
│   ├── sample_-_superstore.xls
│   ├── superstore_sales.csv
│   └── superstore.db
│
├── notebooks/
│   ├── task1_eda.ipynb
│   └── task2_python_sql.ipynb
│
├── reports/
│
├── scripts/
│   ├── convert_xls_to_csv.py
│   └── database_utils.py
│
├── sql/
│   └── business_queries.sql
│
├── .gitignore
└── README.md
```

### Database Setup

The cleaned CSV dataset is loaded into SQLite using Python and SQLAlchemy.

The database contains a main `sales` table with 10,194 records.

The database can be recreated by running:

```bash
python scripts/database_utils.py
```

### SQL Concepts Covered

The project demonstrates:

* SELECT statements
* Filtering with WHERE
* Sorting with ORDER BY
* Aggregation with GROUP BY
* Filtering groups with HAVING
* INNER JOIN
* LEFT JOIN
* Subqueries
* Common Table Expressions (CTEs)
* CASE statements
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* PARTITION BY
* LAG()
* SQL Views

### Business Questions

The SQL analysis addresses the following business questions:

1. Which customers generate the highest sales?
2. Which products generate the highest revenue?
3. Which products generate the highest profit?
4. Which products are causing losses?
5. Which region generates the most sales?
6. Which category performs best?
7. Which customer segment is most profitable?
8. What is the monthly sales trend?
9. What is the average order value?
10. Which customers have high sales but low profit?

### Python and SQL Integration

Python is used to connect to the SQLite database through SQLAlchemy.

Example:

```python
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine("sqlite:///../data/superstore.db")

query = """
SELECT
    "Category",
    SUM("Sales") AS total_sales
FROM sales
GROUP BY "Category"
ORDER BY total_sales DESC;
"""

result = pd.read_sql(query, engine)

result
```

### Database Utility

The `scripts/database_utils.py` script is used to create the SQLite database from the cleaned CSV dataset.

### Results

The SQL analysis provides insights into:

* Customer sales performance
* Product revenue and profitability
* Regional performance
* Category performance
* Customer segment performance
* Monthly sales trends
* Average order value
* Loss-making customers and products

### Task 2 Deliverables

* SQLite database
* SQL business queries
* Python-SQL integration notebook
* Reusable database utility
* Business analysis and insights

### Note

The SQLite database file is generated from the cleaned CSV dataset and is excluded from Git tracking. It can be recreated whenever required using the database utility script.
