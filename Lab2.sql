-- Activity 1

/*
Create a report that produces the following for each employee: earns monthly but wants. Label the column Dream Salaries.
*/
SELECT last_name || ' earns ' || TO_CHAR(salary, 'fm$99,999') || ' monthly buts wants ' || TO_CHAR(salary *3, 'fm$99,999') || '.' "Dream Salaries"
FROM employees;

/*
Create a query that displays employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.”. Label the column COMM.
*/
SELECT last_name, NVL(TO_CHAR(commission_pct), 'No commission') AS "COMM"
FROM employees;

/*
Write a query to display the number of people with the same job.
*/
SELECT job_id, COUNT(job_id)
FROM employees;

/*
Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.
*/
SELECT MAX(salary) - MIN(salary) as "DIFFERENCE"
FROM employees;

/*
The HR department needs a report of all employees with corresponding departments. 
Write a query to display the last name, department number, and department name for these employees.
*/
SELECT last_name, department_id, department_name
FROM employees JOIN departments
USING (department_id)
GROUP BY job_id;

/*
Create a report to display employees’ last names and employee numbers along with their managers’ last names and manager numbers. 
Label the columns Employee, Emp#, Manager, and Mgr#, respectively
*/
SELECT e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", m.employee_id "Mgr#"
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id;

/*
Modify ex. 6 to display all employees, including King, who has no manager.
*/
SELECT emp.last_name "Employee", emp.employee_id "Emp#", man.last_name "Manager", man.employee_id "Mgr#"
FROM employees emp FULL OUTER JOIN employees man
ON emp.manager_id = man.employee_id;

/*
Write a query that displays the employee number and last name of all employees
who work in a department with any employee whose last name contains the letter “u“.
*/
SELECT last_name, employee_id
FROM employees JOIN (SELECT department_id FROM employees WHERE last_name LIKE '%u%')
USING (department_id);

/*
The HR department needs a report that displays the last name, department number, and job ID of all employees whose department location ID is 1700.
*/
SELECT last_name, department_id, job_id
FROM employees JOIN (SELECT department_id FROM departments WHERE location_id = 1700)
USING (department_id);

/*
Create a report for HR that displays the department number, last name, and job ID for every employee in the Executive department.
*/
SELECT department_id, last_name, job_id
FROM employees JOIN (SELECT department_id FROM departments WHERE department_name = 'Executive')
USING (department_id);

-- Activity 2

/*
The HR department needs a list of department IDs for departments that do not contain the job ID ST_CLERK.
*/
SELECT department_id
FROM employees
MINUS
SELECT department_id
FROM employee
WHERE job_id = 'ST_CLERK';

/*
Create a report that lists the detail of all employees who are sales representatives and are currently working in the sales department.
*/
SELECT first_name, last_name
FROM employees JOIN (SELECT job_id FROM jobs WHERE job_title = 'Sales Representative')
USING (job_id)
INTERSECT
SELECT first_name, last_name
FROM employees JOIN (SELECT department_id FROM departments WHERE department_name = 'Sales')
USING (department_id);

/*
Change the salary to $1,000 for all employees with a salary less than $900.
*/
UPDATE employees
SET salary = 1000
WHERE salary < 900;

/*
Create the DEPT table based on the following table instance chart.
*/
CREATE TABLE dept
(id NUMBER(7) CONSTRAINT department_id_pk
PRIMARY KEY,
name VARCHAR2(25));

/*
Add a column JOB_ID in the EMPLOYEES2 table.
*/
CREATE TABLE employees2 AS
SELECT employee_id, first_name, last_name, salary, department_id dept_id
FROM employees;

ALTER TABLE employees2
ADD job_id VARCHAR2(10);

/*
Department 80 needs access to its employee data. Create a view named DEPT80 that contains the employee numbers, employee last names, and department numbers
for all employees in department 80. They have requested that you label the view columns EMPNO, EMPLOYEE, and DEPTNO. 
For security purposes, do not allow an employee to be reassigned to another department through the view.
*/
CREATE VIEW DEPT80 AS
SELECT employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
FROM employees
WHERE department_id = 80
WITH CHECK OPTION CONSTRAINT emp_dept_80;

/*
Attempt to reassign Abel to department 50.
*/
UPDATE employees
SET department_id = 50
WHERE last_name = 'Abel';