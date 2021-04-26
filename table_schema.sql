--1.Create 'titles' table:
CREATE TABLE titles(
	title_id varchar NOT NULL,
	title char(50) NOT NULL,
	PRIMARY KEY(title_id)
);

--2.Create 'departments' table:
CREATE TABLE departments(
	dept_no varchar NOT NULL,
	dept_name char(50) NOT NULL,
	PRIMARY KEY(dept_no)
);

--3.Create 'employees' table:
CREATE TABLE employees (
    emp_no SERIAL,
	emp_title_id varchar(50) NOT NULL,
	birth_date date NOT NULL,
	first_name char(50) NOT NULL, 
	last_name char(50) NOT NULL, 
	sex char(10) NOT NULL, 
	hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--4.Create 'salaries' table:
CREATE TABLE salaries(
	emp_no integer NOT NULL,
	salary integer NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--5.Create 'dept_emp' table:
CREATE TABLE dept_emp(
	emp_no integer NOT NULL,
	dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--6.Create 'dept_manager' table:
CREATE TABLE dept_manager(
	dept_no varchar NOT NULL,
	emp_no integer NOT NULL,
	PRIMARY KEY(dept_no,emp_no)
);





