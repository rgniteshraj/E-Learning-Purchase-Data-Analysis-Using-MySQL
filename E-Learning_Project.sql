-- STEP 1: Create Database
CREATE DATABASE elearning_analysis;

USE elearning_analysis;

-- STEP 2: Create Learners Table

CREATE TABLE learners (
    learner_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    country VARCHAR(50)
);

-- STEP 3: Create Courses Table

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- STEP 4: Create Purchases Table

CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,

    FOREIGN KEY (learner_id)
        REFERENCES learners(learner_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);
 -- Insert Learners

INSERT INTO learners VALUES
(1, 'Arun Kumar', 'India'),
(2, 'Priya Sharma', 'India'),
(3, 'John Smith', 'USA'),
(4, 'David Lee', 'Singapore'),
(5, 'Meena Raj', 'India');


-- Insert Courses

INSERT INTO courses VALUES
(101, 'SQL for Beginners', 'Data Analytics', 2500.00),
(102, 'Python Programming', 'Programming', 3500.00),
(103, 'Power BI Masterclass', 'Data Analytics', 4000.00),
(104, 'Digital Marketing', 'Marketing', 2000.00),
(105, 'Cloud Computing', 'Cloud', 5000.00);


-- Insert Purchases

INSERT INTO purchases VALUES
(1001, 1, 101, 2, '2026-01-10'),
(1002, 2, 102, 1, '2026-01-12'),
(1003, 3, 103, 1, '2026-02-05'),
(1004, 1, 103, 2, '2026-02-10'),
(1005, 4, 104, 1, '2026-02-15'),
(1006, 5, 101, 1, '2026-03-01'),
(1007, 2, 103, 1, '2026-03-05'),
(1008, 3, 102, 2, '2026-03-10');

SELECT * FROM learners;

SELECT * FROM courses;

SELECT * FROM purchases;

SELECT COUNT(*) AS total_learners FROM learners;
SELECT COUNT(*) AS total_courses FROM courses;
SELECT 
    COUNT(*) AS total_purchases
FROM
    purchases;

-- inner join

-- Business requirement: Show learners who have purchased courses, along with their course details.
SELECT
    l.learner_id,
    l.full_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
ORDER BY p.purchase_id;

-- left join
-- Business requirement: Show every learner, even if they have not purchased a course.


SELECT
    l.learner_id,
    l.full_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date

FROM learners l

LEFT JOIN purchases p
    ON l.learner_id = p.learner_id

LEFT JOIN courses c
    ON p.course_id = c.course_id

ORDER BY l.learner_id, p.purchase_id;

-- right join
-- Business requirement: Identify all courses, including courses that have never been purchased


SELECT
    l.full_name,
    l.country,
    c.course_name,
    c.category,
    p.quantity,
    FORMAT(p.quantity * c.unit_price, 2) AS total_amount,
    p.purchase_date

FROM purchases p

RIGHT JOIN courses c
    ON p.course_id = c.course_id

LEFT JOIN learners l
    ON p.learner_id = l.learner_id

ORDER BY c.course_id, p.purchase_id;

-- final verification

-- Verify INNER JOIN
SELECT COUNT(*) AS inner_join_rows
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id;


-- Verify LEFT JOIN
SELECT COUNT(*) AS left_join_rows
FROM learners l
LEFT JOIN purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN courses c
    ON p.course_id = c.course_id;


-- Verify RIGHT JOIN
SELECT COUNT(*) AS right_join_rows
FROM purchases p
RIGHT JOIN courses c
    ON p.course_id = c.course_id;
    

-- Q1: Total Spending by Each Learner

SELECT
    l.learner_id,
    l.full_name,
    l.country,

    FORMAT(
        COALESCE(SUM(p.quantity * c.unit_price), 0),
        2
    ) AS total_spent

FROM learners l

LEFT JOIN purchases p
    ON l.learner_id = p.learner_id

LEFT JOIN courses c
    ON p.course_id = c.course_id

GROUP BY
    l.learner_id,
    l.full_name,
    l.country
ORDER BY
    SUM(COALESCE(p.quantity * c.unit_price, 0)) DESC;
    

-- Q2: Top 3 Most Purchased Courses

SELECT
    c.course_id,
    c.course_name,
    c.category,
    SUM(p.quantity) AS total_quantity_sold
FROM courses c
INNER JOIN purchases p
    ON c.course_id = p.course_id
GROUP BY
    c.course_id,
    c.course_name,
    c.category
ORDER BY
    total_quantity_sold DESC,
    c.course_name ASC
LIMIT 3;


-- Q3: Category-wise Revenue and Unique Learners

SELECT
  c.category,
    FORMAT(
        COALESCE(SUM(p.quantity * c.unit_price), 0),
        2
    ) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses c
LEFT JOIN purchases p
    ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY
    SUM(COALESCE(p.quantity * c.unit_price, 0)) DESC;
 
 
-- Q4: Learners Purchasing from Multiple Categories

SELECT
    l.learner_id,
    l.full_name,
    COUNT(DISTINCT c.category) AS category_count,
    GROUP_CONCAT(
        DISTINCT c.category
        ORDER BY c.category
        SEPARATOR ', '
    ) AS categories_purchased
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC;


-- Q5: Courses with No Purchases

SELECT
    c.course_id,
    c.course_name,
    c.category,
    c.unit_price

FROM courses c
LEFT JOIN purchases p
    ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL
ORDER BY c.course_id;

    


    
    






