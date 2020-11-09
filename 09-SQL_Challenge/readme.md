# SQL Homework - Employee Database: A Mystery in Two Parts
## Background
+ First, used QuickDBD to create an [ERD](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/09-SQL_Challenge/EmployeeSQL/ERD_image.png) of the tables<br>
+ Second, imported ERD PostgreSQL script to create [table](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/09-SQL_Challenge/EmployeeSQL/table_schema.sql) in pgAdmin<br>
+ Third, imported csvs for the various tables:<br>
  - departments<br>
  - dept_emp<br>
  - dept_manager<br>
  - employees<br>
  - salaries<br>
  - titles<br>
+ Finally, used pgAdmin to create [queries](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/09-SQL_Challenge/EmployeeSQL/queries.sql) through the tables to answer the following questions:<br>
  - List the following details of each employee: employee number, last name, first name, sex, and salary.<br>
  - List first name, last name, and hire date for employees who were hired in 1986.<br>
  - List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name<br>
  - List the department of each employee with the following information: employee number, last name, first name, and department name.<br>
  - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".<br>
  - List all employees in the Sales department,including their employee number, last name, first name, and department name.<br>
  - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.<br>
  - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.<br>
## Bonus
+ Imported the SQL database into Pandas<br>
+ Created a histogram to visualize the [most common salary ranges](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/09-SQL_Challenge/EmployeeSQL/Common%20Salary%20Ranges.png)<br>
+ Created a bar chart of [average salary by title](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/09-SQL_Challenge/EmployeeSQL/Average%20Salary%20By%20Title.png)<br>
