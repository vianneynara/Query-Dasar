-- Soal 1
SELECT job_id,
       job_title,
       min_salary,
       max_salary
FROM jobs;

-- Soal 2
SELECT location_id,
       street_address,
       city,
       state_province,
       country_id
FROM locations
WHERE country_id IN ('UK', 'CH', 'US');

-- Soal 3
SELECT e.employee_id,
       j.job_id,
       j.job_title,
       j.min_salary,
       j.max_salary
FROM employees e,
     jobs j
WHERE e.job_id = j.job_id
  AND e.salary BETWEEN 5000 AND 20000
  AND j.job_id LIKE '%CLERK';

-- Soal 4
SELECT first_name || ' ' || last_name AS "FULL_NAME",
       job_id,
       salary
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY "FULL_NAME" ASC;

-- Soal 5
SELECT e.last_name,
       j.job_title,
       TO_CHAR(e.hire_date, 'YYYY-MM-DD') AS "HIRE_DATE"
FROM employees e,
     jobs j
WHERE e.job_id = j.job_id
  AND e.job_id = 'AC_MGR'
ORDER BY last_name DESC;

-- Soal 6
SELECT employee_id,
       first_name || ' ' || last_name AS "FULL_NAME",
       job_id,
       INSTR(LOWER(first_name), 'u')  AS "first 'u' occurence"
--	HIRE_DATE
FROM employees
WHERE hire_date < '01-JAN-1990';

-- Soal 7
SELECT
    first_name || ' ' || last_name AS "FULL_NAME",
    salary AS "GAJI LAMA",
    CASE
        WHEN job_id = 'IT_PROG' AND salary <= 6000 THEN salary * 1.1
        WHEN job_id = 'PU_CLERK' AND salary > 6000 THEN salary * 1.2
        ELSE salary  -- Default case, no change in salary
    END AS "GAJI BARU"
FROM employees;

-- Soal 8
SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM employees e
         LEFT OUTER JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name ASC, e.first_name ASC;