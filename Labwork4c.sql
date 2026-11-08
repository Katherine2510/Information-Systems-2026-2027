use employees;
-- Q1:
CREATE VIEW finance_managers AS
SELECT m.emp_no, m.first_name, m.last_name
    FROM employees m
    JOIN dept_manager dm ON m.emp_no = dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
    WHERE d.dept_name = 'Finance';

SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name IN (
    SELECT last_name
    FROM finance_managers
)
AND emp_no NOT IN (
    SELECT emp_no
    FROM finance_managers
);
-- Q2:
create view LAST_DATE_MANAGER as SELECT max(from_date) as last_date from dept_manager;
select emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees where hire_date = (select last_date from LAST_DATE_MANAGER);

-- Q3:
Create view dept_salary as SELECT dept_no, salary FROM dept_emp JOIN salaries ON dept_emp.emp_no = salaries.emp_no;
SELECT dept_no, AVG(salary) AS AVERAGE
FROM dept_salary 
GROUP BY dept_no
ORDER BY AVERAGE DESC;


 -- Q4:
Create view title_salary as SELECT title, salary FROM titles t JOIN salaries s ON t.emp_no = s.emp_no;
select title, avg(salary) as AVERAGE 
from title_salary
WHERE title LIKE '%Engineer%'
group by title
order by AVERAGE desc




