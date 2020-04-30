--As I tried several times, I have to make sure to delete previus tables failures
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

--Create table departments
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL UNIQUE,
    dept_name VARCHAR (30),
    PRIMARY KEY (dept_no)
);

--Create table employees
CREATE TABLE employees (
    emp_no INT NOT NULL UNIQUE,
    birth_date DATE,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    gender VARCHAR (20),
    hire_date DATE,
    PRIMARY KEY (emp_no)
); 

--Create table dept employees
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    UNIQUE (emp_no, dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--Table dept manager
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL REFERENCES departments(dept_no),
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    UNIQUE (dept_no, emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

--Create titles table, I decided to use employees as primary key, as this is a one to one ralationship
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR (50),
    from_date DATE,
    to_date DATE,
    --As there were repeated values i had to use a three composed pk 
    PRIMARY KEY (emp_no, title, from_date),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Same case here
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
