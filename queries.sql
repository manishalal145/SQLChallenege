--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First name", 
e.sex AS "Gender", 
s.salary AS "Salary"
FROM employees e 
INNER JOIN salaries s
on e.emp_no = s.emp_no

--2.List first name, last name, and hire date for employees who were hired in 1986.
Select first_name AS "First Name" , 
last_name AS "Last Name", 
hire_date AS "Hire Date"
from employees
where EXTRACT(year FROM "hire_date") = 1986;

--3.List the manager of each department with the following information: department number,department name, the manager's employee number, last name, first name.
SELECT d.dept_no, dd.dept_name, e.emp_no,e.last_name,e.first_name
FROM employees e 
INNER JOIN dept_manager d
on e.emp_no = d.emp_no
INNER JOIN departments dd
on d.dept_no = dd.dept_no

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dd.dept_name
FROM employees e 
INNER JOIN dept_emp d
on e.emp_no = d.emp_no 
INNER JOIN departments dd
on d.dept_no = dd.dept_no

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dd.dept_name
FROM employees e 
INNER JOIN dept_emp d
on e.emp_no = d.emp_no 
INNER JOIN departments dd
on d.dept_no = dd.dept_no where dd.dept_no in (
		select dept_no from departments where dept_name ='Sales')


--7.List all employees in the Sales and Development departments, including their employee number, last name,first name, and department name.
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;


--8.In descending order, list the frequency count of employee last names, i.e.how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
