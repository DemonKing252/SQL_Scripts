-- CREATE TABLE employees (
--     emp_no INT PRIMARY KEY AUTO_INCREMENT,
--     department VARCHAR(20),
--     salary INT
-- );
--  
-- INSERT INTO employees (department, salary) VALUES
-- ('engineering', 80000),
-- ('engineering', 69000),
-- ('engineering', 70000),
-- ('engineering', 103000),
-- ('engineering', 67000),
-- ('engineering', 89000),
-- ('engineering', 91000),
-- ('sales', 59000),
-- ('sales', 70000),
-- ('sales', 159000),
-- ('sales', 72000),
-- ('sales', 60000),
-- ('sales', 61000),
-- ('sales', 61000),
-- ('customer service', 38000),
-- ('customer service', 45000),
-- ('customer service', 61000),
-- ('customer service', 40000),
-- ('customer service', 31000),
-- ('customer service', 56000),
-- ('customer service', 55000);

-- SELECT * FROM employees;
-- SELECT emp_no, dept, salary, 
-- SUM(salary) OVER(PARTITION BY dept) AS partitioned_dept,
-- SUM(salary) OVER(PARTITION BY salary) AS partitioned_salary,
-- SUM(salary) OVER(ORDER BY dept) AS ordered_dept, 
-- SUM(salary) OVER(ORDER BY salary) AS ordered_salary, 
-- SUM(salary) OVER(PARTITION BY dept ORDER BY salary) AS rolling_salary, 
-- SUM(salary) OVER(PARTITION BY dept ORDER BY dept) AS total_salary
-- FROM employees;
SELECT 
	emp_no, 
	dept, 
	salary, 
	-- NTILE(4) OVER(PARTITION BY dept ORDER BY salary) AS ordered_ntile
	FIRST_VALUE(emp_no) OVER(PARTITION BY dept ORDER BY salary) AS emp_no
FROM employees;