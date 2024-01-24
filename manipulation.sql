USE customers;
-- SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS sum FROM customers
-- LEFT JOIN orders ON orders.customer_id = customers.id GROUP BY first_name, last_name;

-- DROP TABLE orders, customers;

-- ALTER TABLE orders DROP CONSTRAINT id;
-- DELETE FROM orders WHERE id > 5;

-- DELETE FROM customers WHERE id = 2;

SELECT first_name, IFNULL(AVG(grade), 0) AS average, 
IF(AVG(grade)>=75, 'PASSING', 'FAILING') AS passing_status 
FROM students
LEFT JOIN papers ON students.id = papers.student_id GROUP BY first_name ORDER BY average DESC;