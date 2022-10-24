/*
Create a report to display the last name, job ID,
and hire date for employees with the last names of
Matos and Taylor. Order the query in ascending
order by hire date.
*/
SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name = 'Taylor' OR last_name = 'Matos'
ORDER BY hire_date ASC;

/*
Create a report to display the last name and job
title of all employees who do not have a manager.
*/
SELECT e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.manager_id IS NULL;

/*
The HR department wants to find the duration of
employment for each employee. For each employee,
display the last name and calculate the number of
months between today and the date on which the
employee was hired. Label the column as
MONTHS_WORKED. Order your results by the
number of months employed. The number of months
must be rounded to the closest whole number.
*/
SELECT last_name, round(months_between(sysdate, hire_date)) AS month_worked
FROM employees
ORDER BY month_worked;

/*
Create a query that displays the employees’ last names,
and indicates the amounts of their salaries with asterisks.
Each asterisk signifies a thousand dollars. Sort the data in
descending order of salary. Label the column
EMPLOYEES_AND_THEIR_SALARIES.
*/
SELECT last_name, rpad(' ', salary/1000, '*') AS employees_and_their_salaries
FROM employees
ORDER BY salary ASC;

/*
 Create a query to display the last name and salary for all
employees. Format the salary to be 15 characters long, leftpadded with the $ symbol. Label the column SALARY.
*/
SELECT last_name, lpad(salary, 15, '$') AS salary
FROM employees
ORDER BY salary;

/*
Create a query to display the last name and the
number of weeks employed for all employees in
department 90. Label the number of weeks column
as TENURE. Truncate the number of weeks value to
0 decimal places. Show the records in descending
order of the employee’s tenure.
*/
SELECT last_name, trunc((sysdate-hire_date)/7) AS tenure
FROM employees
WHERE department_id = 90
ORDER BY tenure DESC;