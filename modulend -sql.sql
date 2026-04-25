-- STEP 1 - CREATE A DATABASE
CREATE DATABASE elearning_db;
USE elearning_db;
-- STEP 2 - CREATE TABLE
-- 1. learners table
CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);
-- 2. courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10 , 2 )
);
-- 3. purchase table
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (learner_id)
        REFERENCES learners (learner_id),
    FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
);

-- step 3 -insert sample data 
INSERT INTO learners VALUES
(1, 'Nitesh Raj', 'India'),
(2, 'Raghul Chandar','India'),
(3, 'John Smith', 'USA'),
(4, 'Emma Watson', 'UK'),
(5, 'Rajiv','India');
INSERT INTO courses VALUES
(101, 'SQL Basics', 'Database', 500),
(102, 'Python for Data Science', 'Programming', 800),
(103, 'Power BI Mastery', 'Analytics', 700),
(104, 'Machine Learning', 'AI', 1200),
(105, 'Excel Advanced', 'Analytics', 600),
(106,'Tableau','Analytics',5500);
INSERT INTO purchases VALUES
(1, 1, 101, 2, '2024-01-10'),
(2, 1, 103, 1, '2024-02-15'),
(3, 2, 102, 1, '2024-03-12'),
(4, 3, 104, 1, '2024-01-25'),
(5, 4, 105, 3, '2024-02-20'),
(6, 5, 101, 1, '2024-03-05'),
(7, 2, 103, 2, '2024-03-18'),
(8, 3, 102, 1, '2024-03-22');

-- step4 -INNER JOIN (Main required query)
SELECT 
    l.full_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
   round(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM purchases p
INNER JOIN learners l ON p.learner_id = l.learner_id
INNER JOIN courses c ON p.course_id = c.course_id
ORDER BY (p.quantity * c.unit_price) DESC;

-- LEFT JOIN
SELECT 
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.quantity,
 ROUND(IFNULL(p.quantity*c.unit_price,0),2) AS total_amount,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p 
    ON l.learner_id = p.learner_id
LEFT JOIN courses c 
    ON p.course_id = c.course_id;

-- RIGHT JOIN
SELECT
l.full_name,
c.course_name,
p.quantity
FROM purchases p
RIGHT JOIN courses c
ON p.course_id=c.course_id
LEFT JOIN learners l
ON p.learner_id=l.learner_id;


    -- 4. Analytical Queries
    -- Q1: Total Spending per Learner
    SELECT 
    l.full_name,
    l.country,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
GROUP BY l.full_name, l.country
ORDER BY total_spent DESC;

-- Q2: Top 3 Most Purchased Courses
SELECT 
    c.course_name,
    SUM(p.quantity) AS total_sold
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_name
ORDER BY total_sold DESC
LIMIT 3;

-- Q3: Category Revenue + Unique Learners
SELECT 
    c.category,
    round(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;

-- Q4 Learners purchasing from more than one category
SELECT
l.full_name,
COUNT(DISTINCT c.category) AS categories_bought
FROM purchases p
JOIN learners l
ON p.learner_id=l.learner_id
JOIN courses c
ON p.course_id=c.course_id
GROUP BY l.full_name
HAVING COUNT(DISTINCT c.category)>1;

-- Q5: Courses Not Purchased
SELECT
 c.course_name 
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;

-- Q6: Revenue by Country
SELECT 
    l.country,
    ROUND(SUM(p.quantity * c.unit_price),2) AS total_revenue
FROM learners l
JOIN purchases p
ON l.learner_id = p.learner_id
JOIN courses c
ON p.course_id = c.course_id
GROUP BY l.country
ORDER BY total_revenue DESC;

-- Q7: Average Spending Per Learner
SELECT 
    l.learner_id,
    l.full_name,
    ROUND(AVG(p.quantity * c.unit_price),2) AS avg_spending
FROM learners l
JOIN purchases p
ON l.learner_id = p.learner_id
JOIN courses c
ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name
ORDER BY avg_spending DESC;


 




    
    





