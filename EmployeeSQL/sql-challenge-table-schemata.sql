SELECT * FROM "Employees"

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name,  e.sex, s.salary
FROM "Employees" AS e 
	LEFT JOIN "Salaries" AS s
	ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM "Employees" AS e 
WHERE e.hire_date BETWEEN '1986-01-01' and '1986-12-31';

-- List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
-- SELECT * FROM "Departments"
SELECT d.dept_no, dp.dept_name, d.emp_no, e.last_name, e.first_name
FROM "dept_manager" AS d
	LEFT JOIN "Departments" AS dp
	ON dp.dept_no = d.dept_no
	LEFT JOIN "Employees" AS e
	ON d.emp_no = e.emp_no;
	
-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
-- SELECT * FROM "dept_emp"
SELECT d.emp_no, e.last_name, e.first_name, dp.dept_name 
FROM "dept_emp" AS d
	LEFT JOIN "Departments" AS dp
	ON dp.dept_no = d.dept_no
	LEFT JOIN "Employees" AS e
	ON d.emp_no = e.emp_no;
	
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.last_name, e.first_name,  e.sex
FROM "Employees" AS e 
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e 
	LEFT JOIN "dept_emp"
	on e.emp_no = dept_emp.emp_no
	LEFT JOIN "Departments" AS d
	on dept_emp.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
	
-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" AS e 
	LEFT JOIN "dept_emp"
	on e.emp_no = dept_emp.emp_no
	LEFT JOIN "Departments" AS d
	on dept_emp.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales' OR 
	d.dept_name = 'Development'
	
-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT COUNT(last_name) AS "Name Count", last_name
FROM "Employees" 
GROUP BY last_name 
ORDER BY "Name Count" DESC