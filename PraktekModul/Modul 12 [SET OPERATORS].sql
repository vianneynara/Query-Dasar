-- nomor 1
SELECT department_id -- query A
FROM employees
MINUS
SELECT department_id -- query B
FROM employees
WHERE job_id = 'ST_CLERK';

-- Mencari location_id yang terdapat pada departments
SELECT DISTINCT location_id
FROM departments;

-- Mencari country_id yang terdapat pada locations dimana terdapat pada departments
SELECT DISTINCT country_id
FROM locations
WHERE location_id IN
    (SELECT DISTINCT location_id
     FROM departments);

-- nomor 2a
SELECT country_id, country_name -- query A
FROM countries
MINUS
SELECT country_id, country_name -- query B
FROM countries
WHERE country_id IN -- natural join COUNTRIES dengan LOCATIONS
      (SELECT country_id
       FROM locations
       WHERE location_id IN -- natural join LOCATIONS dengan DEPARTMENTS
             (SELECT d.location_id
              FROM departments d)
       );

-- nomor 2b
SELECT country_id, country_name -- query A
FROM countries
MINUS
SELECT country_id, country_name -- query B
FROM countries NATURAL JOIN locations NATURAL JOIN departments;

-- nomor 3
SELECT job_id, department_id -- query A
FROM employees
WHERE department_id NOT IN (10, 50, 20)
UNION
SELECT job_id, department_id -- query B
FROM employees
WHERE department_id NOT IN (10, 50, 20)

-- nomor 4
SELECT employee_id, job_id -- query A
FROM employees
INTERSECT
SELECT employee_id, job_id -- query B
FROM employees NATURAL JOIN job_history;

SELECT employee_id, job_id FROM job_history;

SELECT
    employee_id, job_id
FROM employees
WHERE employee_id IN (SELECT employee_id FROM job_history)