/*
Display the last name, department number, and salary of any employee
whose department number and salary match the department number and salary of any employee who earns a commission.
*/
SELECT e.last_name, e.department_id, e.salary
FROM employees e
WHERE (e.salary, e.department_id) IN (SELECT a.salary, a.department_id
FROM employees a
WHERE a.commission_pct IS NOT NULL);

/*
Display the last name, hire date, and salary for all employees who have the same salary and manager_ID as Kochhar.
*/
SELECT e.last_name, e.hire_date, e.salary
FROM employees e
WHERE (e.salary, e.manager_id) IN (SELECT a.salary, a.manager_id
FROM employees a
WHERE last_name = 'Kochhar');

/*
Display details such as the employee ID, last name, and department ID of those employees who live in cities the names of which begin with T
*/
SELECT e.employee_id, e.last_name, e.department_id
FROM employees e
WHERE e.department_id IN (SELECT d.department_id 
FROM departments d
WHERE location_id IN (SELECT location_id FROM locations WHERE city like 'T%'));