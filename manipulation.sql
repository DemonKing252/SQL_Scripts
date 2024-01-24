USE tv_db;
-- USE customers;
-- SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS sum FROM customers
-- LEFT JOIN orders ON orders.customer_id = customers.id GROUP BY first_name, last_name;

-- DROP TABLE orders, customers;

-- ALTER TABLE orders DROP CONSTRAINT id;
-- DELETE FROM orders WHERE id > 5;

-- DELETE FROM customers WHERE id = 2;

-- SELECT first_name, IFNULL(AVG(grade), 0) AS average, 
-- IF(AVG(grade)>=75, 'PASSING', 'FAILING') AS passing_status 
-- FROM students
-- LEFT JOIN papers ON students.id = papers.student_id GROUP BY first_name ORDER BY average DESC;

-- SELECT title, ROUND(AVG(rating), 2) AS avg_rating FROM series
-- INNER JOIN reviews ON series.id = reviews.series_id GROUP BY title 
-- ORDER BY avg_rating ASC;

-- SELECT first_name, last_name, rating FROM reviewers
-- INNER JOIN reviews ON reviews.reviewer_id = reviewers.id;

-- SELECT title FROM series
-- LEFT OUTER JOIN reviews ON series.id = reviews.series_id WHERE rating IS NULL;

-- SELECT genre, AVG(rating) FROM series
-- JOIN reviews ON series.id = reviews.series_id GROUP BY genre;

-- SELECT first_name, last_name, 
-- 	IFNULL(COUNT(rating), 0) AS COUNT, 
-- 	IFNULL(MIN(rating), 0) AS MIN, 
-- 	IFNULL(MAX(rating), 0) AS MAX,
-- 	IFNULL(AVG(rating), 0) AS 'AVG',
-- 	CASE 
-- 		WHEN COUNT(rating)=0 THEN 'INACTIVE'
--         WHEN COUNT(rating)>=10 THEN 'VIP'
--         ELSE 'ACTIVE'
-- 	END AS status_rating
-- FROM reviewers
-- LEFT OUTER JOIN reviews ON reviewers.id = reviews.reviewer_id
-- GROUP BY first_name, last_name;
SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer
FROM series 
INNER JOIN reviews ON reviews.series_id = series.id
INNER JOIN reviewers ON reviews.reviewer_id = reviewers.id;
