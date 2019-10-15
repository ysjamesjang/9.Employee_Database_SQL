--departments 
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	CONSTRAINT pk_dept PRIMARY KEY(
		dept_no
	)
);

COPY departments(dept_no,dept_name) 
FROM 'C:\tmp\data\departments.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM departments LIMIT 5;


----------------------------------------------------------------
--employees
DROP TABLE IF EXISTS employees;

CREATE TYPE genders AS ENUM ('M', 'F');
CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender genders,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_emp PRIMARY KEY(
		emp_no
    )
);

COPY employees(emp_no, birth_date, first_name, last_name, gender, hire_date) 
FROM 'C:\tmp\data\employees.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM employees LIMIT 5;

----------------------------------------------------------------
-- dept_emp 
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_deptemp PRIMARY KEY(
		emp_no, dept_no
    ),
    CONSTRAINT fk_deptemp_empno FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
    CONSTRAINT fk_deptemp_deptno FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

COPY dept_emp(emp_no, dept_no, from_date, to_date) 
FROM 'C:\tmp\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM dept_emp LIMIT 5;

----------------------------------------------------------------
-- dept_manager 
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_deptman PRIMARY KEY(
		dept_no, emp_no
    ),
    CONSTRAINT fk_deptman_deptno FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
    CONSTRAINT fk_deptman_empno FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

COPY dept_manager(dept_no, emp_no, from_date, to_date) 
FROM 'C:\tmp\data\dept_manager.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM dept_manager LIMIT 5;

----------------------------------------------------------------
-- salaries
DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_salaries FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

COPY salaries(emp_no, salary, from_date, to_date) 
FROM 'C:\tmp\data\salaries.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM salaries LIMIT 5;

----------------------------------------------------------------
-- titles
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT fk_salaries FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

COPY titles(emp_no, title, from_date, to_date) 
FROM 'C:\tmp\data\titles.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM titles LIMIT 5;