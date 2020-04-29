CREATE TABLE departments (
    dept_no INT NOT NULL,
    dept_name VARCHAR (30),
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date DATE,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    gender VARCHAR (20),
    hire_date DATE,
    PRIMARY KEY (emp_no)
); 

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no INT NOT NULL,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY emp_no REFERENCES employees.emp_no,
    FOREIGN KEY dept_no REFERENCES departments.dept_no,
    PRIMARY KEY (emp_no, dept_no)
);
    
CREATE TABLE dept_manager (
    dept_no INT NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (dept_no) REFERENCES departments.dept_no,
    FOREIGN KEY (emp_no) REFERENCES dept_emp.emp_no,
    PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE titles
    emp_no INT NOT NULL,
    title VARCHAR (50),
    to_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY emp_no REFERENCES employees.emp_no
);
    
CREATE TABLE salaries
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no),
    FOREIGN KEY emp_no REFERENCES employees.emp_no
);






