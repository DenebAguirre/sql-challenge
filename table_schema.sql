--As I tried several times, I have to make sure to delete previus tables failures
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

--Create table departments
CREATE TABLE departments (
    dept_no INT NOT NULL,
    dept_name VARCHAR (30),
    PRIMARY KEY (dept_no)
);

--Create table employees
CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    gender VARCHAR (20),
    hire_date DATE,
    PRIMARY KEY (emp_no)
); 

--Create table dept employees, here I use the UNIQUE function to tell wich values are going to be 
--unique in the primary key relationship
CREATE TABLE dept_emp (
    emp_no INT NOT NULL REFERENCES employees(emp_no) UNIQUE,
    dept_no INT NOT NULL REFERENCES departments(dept_no),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no, dept_no)
);

--As in the past table I use unique, but here the unique one is going to be departments    
CREATE TABLE dept_manager (
    dept_no INT NOT NULL REFERENCES departments(dept_no) UNIQUE,
    emp_no INT NOT NULL REFERENCES dept_emp(emp_no),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (dept_no, emp_no)
);

--Create titles table, I decided to use employees as primary key, as this is a one to one ralationship
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR (50),
    to_date DATE,
    PRIMARY KEY (emp_no),
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
