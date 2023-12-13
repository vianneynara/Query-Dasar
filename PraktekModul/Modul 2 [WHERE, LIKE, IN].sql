-- nomor 1
SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name IN ('Austin', 'Taylor');

-- nomor 2
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- nomor 3
SELECT employee_id, last_name
FROM employees
WHERE last_name LIKE '__e%'

-- nomor 4
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '01-JAN-1998';
-- WHERE HIRE_DATE >= '01-JAN-98';
-- WHERE HIRE_DATE >= '%98';

-- nomor 5
SELECT last_name
FROM employees
WHERE last_name LIKE 'P%';

-- nomor 6
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE 'IT&_%' ESCAPE '&';

-- nomor 7
SELECT last_name, salary
FROM employees
WHERE salary > 14000;

-- nomor 8
SELECT last_name, department_id
FROM employees
WHERE employee_id = 124;

-- nomor 9
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

-- nomor 10
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '%2004';
