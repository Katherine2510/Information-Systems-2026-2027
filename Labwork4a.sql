use employees;
select emp_no, avg(salary)  from salaries group by emp_no;
select emp_no, sum(salary)  from salaries group by emp_no;
select de.dept_no, Min(s.salary) as MIN, max(s.salary) as MAX, sum(s.salary) as total 
from salaries s
join dept_emp de on s.emp_no = de.emp_no
group by de.dept_no;
select de.dept_no, sum(s.salary) as total 
from salaries s
join dept_emp de on s.emp_no = de.emp_no
group by de.dept_no
HAVING total > 20000000000;
select de.dept_no, sum(salary) as totalM 
from salaries s
join dept_emp de on s.emp_no = de.emp_no
join employees e on e.emp_no = de.emp_no
where e.gender = "M"
group by de.dept_no;
select dm.dept_no, sum(salary) as totalManager 
from salaries s
join dept_manager dm on dm.emp_no = s.emp_no
group by dm.dept_no
order by totalManager DESC;









