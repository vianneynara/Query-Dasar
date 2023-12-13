-- nomor 1: True
-- nomor 2: False
-- nomor 3:

-- nomor 4
SELECT MAX(salary)           AS maximum,
       MIN(salary)           AS minimum,
       SUM(ALL salary)       AS sum,
       ROUND(AVG(salary), 0) AS average
FROM employees;

-- nomor 5
SELECT job_id,
       MAX(salary)           AS maximum,
       MIN(salary)           AS minimum,
       SUM(ALL salary)       AS sum,
       ROUND(AVG(salary), 0) AS average
FROM employees
GROUP BY job_id;

-- nomor 6
SELECT job_id,
       COUNT(ALL job_id) AS jumlah
FROM employees
GROUP BY job_id;

-- nomor 7
SELECT COUNT(DISTINCT manager_id) AS "Jumlah Manager"
FROM employees;

-- nomor 8
SELECT MAX(salary) - MIN(salary) AS "Perbedaan Gaji"
FROM employees;

-- nomor 9
SELECT DISTINCT manager_id,
                MIN(salary) AS "Min. Salary"
FROM employees
GROUP BY manager_id
ORDER BY "Min. Salary";

-- nomor 10
SELECT COUNT(*)                                                   AS total,
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2001', '1', '')) AS "2001",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2002', '1', '')) AS "2002",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2003', '1', '')) AS "2003",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '2004', '1', '')) AS "2004"
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') IN ('2001', '2002', '2003', '2004');

-- nomor 11
SELECT job_id                                    AS job,
       SUM(DECODE(department_id, 20, salary, 0)) AS "Dept 20",
       SUM(DECODE(department_id, 50, salary, 0)) AS "Dept 50",
       SUM(DECODE(department_id, 80, salary, 0)) AS "Dept 80",
       SUM(DECODE(department_id, 90, salary, 0)) AS "Dept 90",
       SUM(salary)                               AS total
FROM employees
GROUP BY job_id
ORDER BY job;
