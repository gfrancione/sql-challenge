--List the employee number, last name, first name, sex, and salary of each employee.

SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY 1;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.s
SELECT 
    d.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM 
    departments d
INNER JOIN 
    dept_manager dm ON d.dept_no = dm.dept_no
INNER JOIN 
    employees e ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
ORDER BY 1;

-- 6.List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM 
    employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';




--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM 
    employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;


