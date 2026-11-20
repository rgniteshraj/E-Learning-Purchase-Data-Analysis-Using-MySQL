
# E-Learning Platform Purchase Analysis Using MySQL and Power BI

An end-to-end Data Analytics project analyzing learner purchasing behaviour, course performance, and sales insights using **MySQL** and **Microsoft Power BI**.

## 📌 Project Overview

This project analyzes purchase data from an e-learning platform using a relational database consisting of three tables:

- Learners
- Courses
- Purchases

MySQL is used to perform SQL analysis, while Power BI is used to develop an interactive dashboard to visualize business insights.

## 🎯 Project Objectives

- Analyze learner purchasing behaviour.
- Identify the top 3 most purchased courses.
- Analyze category-wise revenue.
- Identify learners purchasing across multiple categories.
- Find courses that have never been purchased.
- Analyze revenue by country.
- Calculate average spending per learner.
- Develop an interactive Power BI dashboard.

## 🛠️ Tools & Technologies

| Technology | Purpose |
|---|---|
| MySQL | Database management and SQL analysis |
| Power BI Desktop | Dashboard development |
| SQL | Data querying and analysis |

## 🗄️ Database Structure

### 1. Learners Table

| Column |
|---|
| learner_id |
| full_name |
| country |

### 2. Courses Table

| Column |
|---|
| course_id |
| course_name |
| category |
| unit_price |

### 3. Purchases Table

| Column |
|---|
| purchase_id |
| learner_id |
| course_id |
| purchase_date |
| quantity |

## 📊 SQL Analysis

The project includes the following analysis:

1. Learner Spending Analysis
2. Top Performing Courses
3. Category Revenue Performance
4. Multi-Category Learner Behaviour
5. Unpurchased Course Identification
6. Revenue by Country
7. Average Spending per Learner

### SQL Concepts Applied

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions

## 📈 Power BI Dashboard

The dashboard contains two interactive pages.

Both pages include:
- Country Slicer
- Category Slicer
- Course Name Slicer

### Page 1: Sales & Purchase Analysis

#### Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Revenue | ₹36,000 |
| Total Purchases | 8 |
| Total Learners | 5 |
| Quantity Sold | 11 |
| Average Order Value | ₹4,500 |

#### Visualizations

**1. Total Revenue by Category**

| Category | Revenue |
|---|---:|
| Data Analytics | ₹23,500 |
| Programming | ₹10,500 |
| Marketing | ₹2,000 |

**2. Top 3 Most Purchased Courses**

| Course | Quantity |
|---|---:|
| Power BI Masterclass | 4 |
| Python Programming | 3 |
| SQL for Beginners | 3 |

**3. Learner-wise Spending**

| Learner | Spending |
|---|---:|
| Arun Kumar | ₹13,000 |
| John Smith | ₹11,000 |
| Priya Sharma | ₹7,500 |
| Meena Raj | ₹2,500 |
| David Lee | ₹2,000 |

### Page 2: Customer & Course Insights

**1. Multiple-Category Learners**

| Learner | Category Count |
|---|---:|
| John Smith | 2 |
| Priya Sharma | 2 |

**2. Courses Never Purchased**

| Course | Category | Unit Price |
|---|---|---:|
| Cloud Computing | Cloud | ₹5,000 |

**3. Course Distribution by Category**

| Category | Count | Percentage |
|---|---:|---:|
| Data Analytics | 2 | 40% |
| Cloud | 1 | 20% |
| Marketing | 1 | 20% |
| Programming | 1 | 20% |

**4. Monthly Purchase Trend**

| Month | Purchases |
|---|---:|
| January | 2 |
| February | 3 |
| March | 3 |

## 💡 Key Business Insights

- Data Analytics generates the highest revenue among the displayed categories.
- Power BI Masterclass has the highest purchase quantity among the top three courses.
- Arun Kumar has the highest learner spending among the displayed learners.
- John Smith and Priya Sharma have purchased courses across multiple categories.
- Cloud Computing has no recorded purchases.
- February and March show higher purchase activity than January.

## 🚀 Business Recommendations

- Promote high-performing courses.
- Improve visibility of courses without purchases.
- Implement cross-selling strategies.
- Provide personalized offers to high-spending learners.
- Focus marketing on high-revenue categories.
- Analyze country-wise revenue for regional marketing.
- Monitor monthly purchase trends.

## 🧠 Skills Demonstrated

- MySQL Database Management
- SQL Joins and Aggregate Functions
- Data Analysis
- Revenue Analysis
- Learner Behaviour Analysis
- Power BI Dashboard Development
- Data Visualization
- Business Intelligence

## 📂 Repository Structure

```text
E-Learning-Platform-Purchase-Analysis/
│
├── README.md
│
├── E-Learning_Project.sql
│
├── PowerBI/
│   └── E-Learning-Platform.pbix
│
├── Report/
│   └── Project_Report.pdf
│
└── Images/
    ├── Dashboard_Page1.png
    └── Dashboard_Page2.png
```

*Note: The structure above is suggested. Include only files available in your project.*

## 🔮 Future Enhancements

- Learner retention analysis
- Course completion analysis
- Advanced DAX calculations
- Date-range filtering
- Interactive drill-through reports
- Automated data refresh

## 📝 Conclusion

This project demonstrates how MySQL and Microsoft Power BI can be combined to analyze e-learning purchase data and generate meaningful business insights.

It provides practical experience in SQL querying, database analysis, dashboard development, data visualization, and business intelligence.

---

**Project:** E-Learning Platform Purchase Analysis

**Tools:** MySQL | Microsoft Power BI

**Domain:** Data Analytics & Business Intelligence

**Author:** Your Name
