--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT "Employees".emp_no as "employee number", "Employees".last_name as "last name", "Employees".first_name as "first name", "Employees".gender, "Salaries".salary
FROM "Employees"
JOIN "Salaries" 
ON "Salaries".emp_no = "Employees".emp_no

--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE extract (year from hire_date) = '1986'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates

SELECT "Department".dept_no as "department number", 
"Department".dept_name as "department name", 
"Employees".emp_no as "manager employee number",
"Employees".last_name as "last name", 
"Employees".first_name as "first name",
"DepartmentEmployees".from_date as "start employment date",
"DepartmentEmployees".to_date as "end employment date"
FROM "Department"
JOIN "DepartmentEmployees"
ON "Department".dept_no = "DepartmentEmployees".dept_no
JOIN "Employees"
ON "Employees".emp_no = "DepartmentEmployees".emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "DepartmentEmployees".emp_no as "employee number", 
"Employees".last_name as "last name", 
"Employees".first_name as "first name",
"Department".dept_name as "department name"
FROM "DepartmentEmployees"
JOIN "Employees"
ON "Employees".emp_no = "DepartmentEmployees".emp_no
JOIN "Department"
ON "Department".dept_no = "DepartmentEmployees".dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM "Employees"
SELECT first_name as "first name", last_name as "last name"
FROM "Employees"
WHERE first_name = 'Hercules' AND left(last_name,1) ='B'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "DepartmentEmployees".emp_no, "Employees".last_name, "Employees".first_name, "Department".dept_name
FROM "DepartmentEmployees"
JOIN "Employees"
ON "DepartmentEmployees".emp_no = "Employees".emp_no
JOIN "Department"
ON "DepartmentEmployees".dept_no = "Department".dept_no
WHERE "Department".dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "DepartmentEmployees".emp_no, "Employees".last_name, "Employees".first_name, "Department".dept_name
FROM "DepartmentEmployees"
JOIN "Employees"
ON "DepartmentEmployees".emp_no = "Employees".emp_no
JOIN "Department"
ON "DepartmentEmployees".dept_no = "Department".dept_no
WHERE "Department".dept_name = 'Sales' 
OR "Department".dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "last name", count(*)
FROM "Employees"
Group by last_name
Order by count desc


