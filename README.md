# E-Learning Purchase Data Analysis Using MySQL

## Project Overview
This project analyzes purchase data from an e-learning platform using MySQL.  
A relational database was designed using three tables — learners, courses, and purchases — to study learner behavior, sales performance, and course popularity through SQL joins, aggregations, and analytical queries.

## Problem Statement
The objective of this project is to derive meaningful insights from e-learning purchase data, including:
- Sales trends
- Learner behavior
- Course popularity
- Revenue performance

## Database Schema
The project consists of three relational tables:

### Learners
- learner_id (Primary Key)
- full_name
- country

### Courses
- course_id (Primary Key)
- course_name
- category
- unit_price

### Purchases
- purchase_id (Primary Key)
- learner_id (Foreign Key)
- course_id (Foreign Key)
- quantity
- purchase_date

## Skills Applied
- Database Design and Schema Creation
- SQL Joins (INNER, LEFT, RIGHT)
- Aggregation using GROUP BY, HAVING, ORDER BY
- Revenue and Spending Calculations
- Business Insight Generation through SQL Analysis

## Analytical Queries Performed

### 1. Learner Spending Analysis
Calculated total spending by each learner based on quantity × unit price to identify high-value learners.

### 2. Top Performing Courses
Identified top 3 most purchased courses based on quantity sold.

### 3. Category Revenue Performance
Analyzed:
- Total revenue by category
- Number of unique learners in each category

### 4. Multi-Category Learner Behavior
Identified learners purchasing from multiple categories for cross-selling opportunities.

### 5. Unpurchased Course Identification
Detected courses with no purchases, indicating possible low-performing offerings.

## Additional Analysis
### Revenue by Country
Analyzed country-wise revenue contribution to understand geographic demand.

### Average Spending Per Learner
Measured average purchase spending per learner to evaluate transaction behavior.

## Key Insights
- High-demand courses drive engagement and revenue.
- Some categories contribute significantly more revenue.
- Multi-category learners present upselling opportunities.
- Unpurchased courses may require promotion or optimization.
- Geographic sales trends support region-specific marketing.

## Recommendations
- Focus marketing on top-performing courses and categories.
- Promote underperforming or unpurchased courses.
- Use cross-selling strategies for multi-category learners.
- Target high-spending learners with personalized offers.
- Expand popular course categories to increase revenue.

## Files Included
- project.sql
- Summary_Report.pdf
- README.md

## Sample SQL Query
```sql
SELECT 
    l.full_name,
    SUM(p.quantity * c.unit_price) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name
ORDER BY total_spent DESC;
```

## Conclusion
This project demonstrates how MySQL can transform transactional purchase data into actionable business insights to support sales optimization, learner engagement, and course strategy.

## Author
Nitesh Raj R G
