-- nomor 1
SELECT last_name employee, salary AS "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 5000 AND 12000)
  AND (department_id = 20 OR department_id = 60);

-- nomor 2
SELECT last_name, department_id
FROM employees
WHERE (department_id IN (20, 50))
ORDER BY last_name DESC;

-- nomor 3
SELECT last_name
FROM employees
WHERE (last_name LIKE '%a%')
  AND (last_name LIKE '%e%');

-- nomor 4
SELECT last_name, job_id, hire_date
FROM employees
WHERE (hire_date BETWEEN '01-FEB-1998' AND '31-DEC-2000')
ORDER BY hire_date;

-- nomor 5
SELECT last_name, salary, commission_pct
FROM employees
WHERE (commission_pct IS NOT NULL)
ORDER BY salary DESC, commission_pct DESC;

-- nomor 6
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id IN ('SA_REP', 'SH_CLERK'))
  AND (salary NOT IN (2500, 3500, 7000));

-- nomor 7
SELECT last_name, job_id, salary
FROM employees
WHERE (last_name LIKE 'O%')
ORDER BY last_name ASC, job_id DESC;

-- nomor 8
SELECT department_id, last_name, salary, commission_pct
FROM employees
WHERE (commission_pct IS NULL)
ORDER BY department_id DESC, last_name ASC;

-- nomor 9
SELECT department_id, last_name, salary, commission_pct
FROM employees
WHERE (salary > 10000 OR salary < 7000)
  AND (commission_pct > 0.10)
ORDER BY department_id DESC;

-- nomor 10
SELECT department_id department, last_name employee, salary AS "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 5000 AND 12000)
  AND (department_id = 20 OR department_id = 50)
ORDER BY "Monthly Salary" DESC;
