--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary
FROM employees a
INNER JOIN salaries b
ON a.emp_no = b.emp_no;

------------------------------------------------------------------
--2. List employees who were hired in 1986.
---->Simple
SELECT a.emp_no, a.last_name, a.first_name, EXTRACT(YEAR FROM a.hire_date) hire_year 
FROM employees a
WHERE EXTRACT(YEAR FROM a.hire_date)=1986;

----> Using subqueries
SELECT * FROM(
	SELECT a.emp_no, a.last_name, a.first_name, EXTRACT(YEAR FROM a.hire_date) hire_year 
	FROM employees a
) AS x
WHERE hire_year=1986;

------------------------------------------------------------------
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT a.dept_no, b.dept_name,c.emp_no, c.last_name, c.first_name, a.from_date, a.to_date
FROM dept_manager a 
	INNER JOIN departments b
		ON a.dept_no=b.dept_no
	INNER JOIN employees c
		ON a.emp_no=c.emp_no;

------------------------------------------------------------------
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

------------------------------------------------------------------
--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

------------------------------------------------------------------
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

------------------------------------------------------------------
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

------------------------------------------------------------------
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;