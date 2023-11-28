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
	first_name VARCHAR(30)NOT NULL,
	last_name VARCHAR(30)NOT NULL,
	sex VARCHAR(1)NOT NULL,
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

--List the employee number, last name, first name, sex, and salary of each employee
SELECT employee.emp_no, last_name, first_name, sex, salary.salary FROM employee
INNER JOIN salary ON salary.emp_no = employee.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employee
  WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, dept_manager.emp_no, department.dept_name, employee.last_name, employee.first_name FROM dept_manager
LEFT JOIN department ON department.dept_no = dept_manager.dept_no
LEFT JOIN employee ON employee.emp_no = dept_manager.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_employee.emp_no, dept_employee.dept_no, department.dept_name, employee.last_name, employee.first_name FROM dept_employee
LEFT JOIN department ON department.dept_no = dept_employee.dept_no
LEFT JOIN employee ON employee.emp_no = dept_employee.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM employee
  WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT employee.emp_no, employee.first_name, employee.last_name, department.dept_name FROM dept_employee
LEFT JOIN department ON department.dept_no = dept_employee.dept_no
LEFT JOIN employee ON employee.emp_no = dept_employee.emp_no
WHERE department.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employee.emp_no, employee.first_name, employee.last_name, department.dept_name FROM dept_employee
LEFT JOIN department ON department.dept_no = dept_employee.dept_no
LEFT JOIN employee ON employee.emp_no = dept_employee.emp_no
WHERE department.dept_name = 'Sales' OR department.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT COUNT(last_name) AS "last_name_count", last_name FROM employee
GROUP BY last_name
ORDER BY "last_name_count" DESC

