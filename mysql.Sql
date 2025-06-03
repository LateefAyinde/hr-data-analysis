-- Total number of employees in each department

SELECT d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) AS total_employees
FROM departments d
INNER JOIN employees e
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
ORDER BY total_employees DESC;

-- Average salary of employees for each job role and display the job title along with the average salary.

SELECT j.JOB_TITLE, ROUND(AVG(e.SALARY),0) AS Average_Salary
FROM jobs j
JOIN employees e
ON j.JOB_ID = e.JOB_ID
GROUP BY j.JOB_TITLE;

-- List all employees along with their department names and location details.

SELECT e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_NAME, l.CITY, l.STATE_PROVINCE, l.COUNTRY_ID
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l ON d.LOCATION_ID = l.LOCATION_ID;

-- Employees who earn more than the average salary of their department.

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM employees
WHERE SALARY >
(SELECT AVG(SALARY) FROM employees);

 -- Department that has the highest total salary expense.
    
SELECT d.DEPARTMENT_NAME, SUM(e.SALARY) AS total_salary_expense
FROM departments d
JOIN employees e
ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
ORDER BY total_salary_expense DESC
LIMIT 1;
    
    -- Employee(s) with the highest salary in the company.
    
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM employees WHERE SALARY =
(SELECT MAX(SALARY) FROM employees);
    
    -- Names of employees who report directly to a specific manager (e.g., manager ID = 100)
    
SELECT FIRST_NAME, LAST_NAME, MANAGER_ID
FROM employees
WHERE MANAGER_ID = 100;
    
    -- Employees who have been working for the company for more than 5 years.
    
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM employees
WHERE HIRE_DATE > 5;
    
    -- Top 5 highest-paid employees along with their job titles.
    
SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY, j.JOB_TITLE
FROM employees e
INNER JOIN jobs j
ON e.JOB_ID = j.JOB_ID
ORDER BY e.SALARY DESC
LIMIT 5;
    
    -- Number of employees hired each year in descending order.
    
SELECT YEAR(HIRE_DATE) AS hire_year, COUNT(*) total_hired
FROM employees
GROUP BY hire_year
ORDER BY total_hired DESC;