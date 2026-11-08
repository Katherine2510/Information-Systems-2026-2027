select * from employees;
select * from departments ;
select first_name, last_name from employees;
select dept_name from departments;

select CONCAT(first_name,' ' ,last_name) AS full_name from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departments depa on de.dept_no = depa.dept_no 
where
depa.dept_name = "Sales";

select CONCAT(first_name,' ' ,last_name) AS full_name from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departments depa on de.dept_no = depa.dept_no 
where
e.gender = "M" and depa.dept_name = "Finance"; 

select salary from salaries s
join employees e on e.emp_no = s.emp_no
join dept_emp de on e.emp_no = de.emp_no
join departments depa on de.dept_no = depa.dept_no 
where
e.gender = "F" and depa.dept_name = "Marketing";

SELECT DISTINCT CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN dept_manager dm ON de.dept_no = dm.dept_no
JOIN employees m ON dm.emp_no = m.emp_no
WHERE e.last_name = m.last_name
  AND e.emp_no != m.emp_no;
  
select CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees e
JOIN dept_manager dm ON dm.emp_no = e.emp_no
group by e.emp_no, e.first_name, e.last_name
having count(*) >= 2;

select DISTINCT CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > 100000;

select distinct de.dept_name AS departemnts
FROM departments de
join dept_emp det on det.dept_no = de.dept_no 
join employees e on e.emp_no = det.emp_no
join salaries s on e.emp_no = s.emp_no
where s.salary > 100000;

INSERT INTO departments (dept_no, dept_name)
VALUES
('d010', 'Research and Development'),
('d011', 'Marketing and Sales');

INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)

select emp_no, 
case  
	WHEN dept_no IN ('d005', 'd008') THEN 'd010'
	WHEN dept_no IN ('d001', 'd007') THEN 'd011'
    END AS new_dept_no,
MIN(from_date),
MAX(to_date)
from dept_emp where dept_no 
IN ('d005', 'd008',  'd001', 'd007') 
GROUP BY emp_no, new_dept_no;

INSERT INTO dept_manager (emp_no, dept_no, from_date, to_date)

select emp_no, 
case  
	WHEN dept_no IN ('d005', 'd008') THEN 'd010'
	WHEN dept_no IN ('d001', 'd007') THEN 'd011'
    END AS new_dept_no,
MIN(from_date),
MAX(to_date)
from dept_manager where dept_no 
IN ('d005', 'd008',  'd001', 'd007') 
GROUP BY emp_no, new_dept_no;

DELETE FROM dept_emp
WHERE dept_no IN ('d005', 'd008', 'd001', 'd007');

DELETE FROM dept_manager
WHERE dept_no IN ('d005', 'd008', 'd001', 'd007');

DELETE FROM departments
WHERE dept_no IN ('d005', 'd008', 'd001', 'd007');

SELECT *
FROM departments;
  
  

