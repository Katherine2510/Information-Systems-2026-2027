use employees;

SELECT emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name IN (
    SELECT m.last_name
    FROM employees m
    JOIN dept_manager dm ON m.emp_no = dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
    WHERE d.dept_name = 'Finance'
)
AND emp_no NOT IN (
    SELECT dm.emp_no
    FROM dept_manager dm
    JOIN departments d ON dm.dept_no = d.dept_no
    WHERE d.dept_name = 'Finance'
);

select emp_no, CONCAT(first_name, ' ', last_name) AS full_name
FROM employees where hire_date = (SELECT max(from_date) from dept_manager);

SELECT dept_no, AVG(salary) AS AVERAGE
FROM (
    SELECT dept_no, salary
    FROM dept_emp
    JOIN salaries ON dept_emp.emp_no = salaries.emp_no
) AS t
GROUP BY dept_no
ORDER BY AVERAGE DESC;

select title, avg(salary) as AVERAGE 
FROM (
    SELECT title, salary
    FROM titles t
    JOIN salaries s ON t.emp_no = s.emp_no
) AS av
WHERE title LIKE '%Engineer%'
group by title
order by AVERAGE desc;






