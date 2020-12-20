-- Analysis #1 List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE OR REPLACE VIEW Analysis_1 AS
SELECT e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.sex, 
    s.salary
FROM Salaries AS s
	INNER JOIN Employees AS e
	ON e.emp_no=s.emp_no;

-- Analysis #2 List first name, last name, and hire date for employees who were hired in 1986.
CREATE OR REPLACE VIEW Analysis_2 AS
SELECT first_name, last_name, hire_date
FROM Employees
	WHERE
      hire_date >= '1986-01-01'
  	AND hire_date <  '1986-12-31';

-- Analysis #3 List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
CREATE OR REPLACE VIEW Analysis_3 AS
SELECT d.dept_no, 
	d.dept_name,
	e.emp_no AS manager_emp_no,
	e.last_name,
	e.first_name
FROM Departments AS d
	INNER JOIN Dept_Manager AS dm
	ON d.dept_no=dm.dept_no
		INNER JOIN Employees AS e 
		ON e.emp_no=dm.emp_no;

-- Anaylsis #4 List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
-- First, check to see if there are duplicate entries.
SELECT 
    emp_no, COUNT(emp_no),
    dept_no,  COUNT(dept_no)
FROM
    Dept_Employees
GROUP BY 
    emp_no, 
    dept_no
HAVING  COUNT(emp_no) > 1
    AND COUNT(dept_no) > 1;

-- There are no duplicate entries, so continue with query. 
CREATE OR REPLACE VIEW Analysis_4 AS
SELECT e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM Employees AS e
	INNER JOIN Dept_Employees AS de
	ON de.emp_no=e.emp_no
		INNER JOIN Departments AS d 
		ON d.dept_no=de.dept_no;

-- Analysis #5 List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
CREATE OR REPLACE VIEW Analysis_5 AS
SELECT first_name,
	last_name,
	sex
	FROM Employees
		WHERE first_name = 'Hercules'
		AND last_name LIKE 'B%';

-- Analysis #6 List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
CREATE OR REPLACE VIEW Analysis_6 AS
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees AS e
	JOIN Dept_Employees AS de
	ON (e.emp_no=de.emp_no)
		JOIN Departments AS d
		ON de.dept_no=d.dept_no
		WHERE dept_name = 'Sales';

-- Anaylsis #7 List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
CREATE OR REPLACE VIEW Analysis_7 AS
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees AS e
	JOIN Dept_Employees AS de
	ON (e.emp_no=de.emp_no)
		JOIN Departments AS d
		ON de.dept_no=d.dept_no
		WHERE dept_name IN ('Sales', 'Development');

-- Analysis #8 In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
CREATE OR REPLACE VIEW Analysis_8 AS
SELECT 
    last_name, COUNT(last_name) AS last_name_count
FROM
Employees
 	GROUP BY 
    last_name
	ORDER BY last_name_count DESC;

