-- Create dept table
CREATE TABLE department (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_no)
);

--Create titles table
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(30) NOT NULL,
    PRIMARY KEY (title_id)
);

--Create employee table
CREATE TABLE employee (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT Null,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create dept_employee table
CREATE TABLE dept_employee (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

--Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

--Create salary table
CREATE TABLE salary (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

