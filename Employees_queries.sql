-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM "Employees" e
	JOIN "Salaries" s ON e.emp_no = s.emp_no
	ORDER BY e.last_name ASC, s.salary DESC;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, EXTRACT(YEAR from hire_date) AS hire_year
	FROM "Employees"
	WHERE  EXTRACT(YEAR from hire_date) = 1986
	ORDER BY last_name;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT e.first_name, e.last_name, m.dept_no, d.dept_name, m.emp_no
	FROM "Employees" e
	JOIN "Dept_manager" m ON e.emp_no = m.emp_no
	JOIN "Departments" d ON d.dept_id = m.dept_no
	ORDER BY m.dept_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name 
	FROM "Dept_emp" de
	JOIN "Employees" e ON de.emp_no = e.emp_no
	JOIN "Departments" d ON d.dept_id = de.dept_no
	ORDER BY d.dept_id;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex
	FROM "Employees" e
	WHERE e.first_name = 'Hercules'
		AND e.last_name LIKE 'B%'
	ORDER BY e.last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
	FROM "Employees" e
	JOIN "Dept_emp" de ON e.emp_no = de.emp_no
	JOIN "Departments" d ON d.dept_id = de.dept_no
	WHERE d.dept_name = 'Sales'
	ORDER BY e.last_name;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM "Employees" e
	JOIN "Dept_emp" de ON e.emp_no = de.emp_no
	JOIN "Departments" d ON d.dept_id = de.dept_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
	ORDER BY d.dept_name, e.last_name;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT e.last_name, COUNT(e.last_name) as num_last_names
	FROM "Employees" e
	GROUP BY e.last_name
	ORDER BY e.last_name DESC;