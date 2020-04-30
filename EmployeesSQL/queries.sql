-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2. List employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary, e.hire_date
FROM employees e
LEFT JOIN salaries s
ON (e.emp_no = s.emp_no)
WHERE e.hire_date >= '1986-01-01'
AND e.hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name,
-- and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, man.from_date, man.to_date
FROM dept_manager man
INNER JOIN departments d
ON (man.dept_no = d.dept_no)
INNER JOIN employees e
ON (man.emp_no = e.emp_no);


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT demp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp demp
JOIN employees e
ON  (demp.emp_no = e.emp_no)
JOIN departments d
ON (demp.dept_no = d.dept_no);


-- 5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6 List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
JOIN employees e
ON (dept_emp.emp_no = e.emp_no)
JOIN departments d
ON (dept_emp.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'

--7 List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
JOIN employees e
ON (dept_emp.emp_no = e.emp_no) 
JOIN departments d
ON (dept_emp.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'

--8 In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT e.last_name, COUNT(last_name) AS share_lastname
FROM employees e
GROUP BY last_name
ORDER BY share_lastname DESC;