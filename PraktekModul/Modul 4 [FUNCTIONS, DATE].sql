-- nomor 1
SELECT employee_id,
       INITCAP(last_name) AS last_name,
       LENGTH(last_name)  AS "LENGTH(LAST_NAME)"
FROM employees
WHERE SUBSTR(INITCAP(last_name), 1, 1) IN ('J', 'A', 'M')
ORDER BY last_name;

-- nomor 2
SELECT employee_id,
       first_name,
       LOWER(SUBSTR(first_name, 1, 1)) || UPPER(SUBSTR(first_name, 2)) AS first_name2,
       INSTR(first_name, 'a')                                          AS "posisi a"
FROM employees
WHERE first_name LIKE '%n'
ORDER BY first_name;

-- nomor 3
SELECT employee_id,
       last_name,
       LPAD(salary, 10, '$') AS salary
FROM employees
WHERE job_id = 'SA_REP'
ORDER BY last_name;

-- nomor 4
SELECT employee_id,
       last_name,
       salary,
       ROUND(salary * 1.17, 2) AS "NEW SALARY"
FROM employees
ORDER BY "NEW SALARY" DESC;

-- nomor 5
SELECT employee_id,
       last_name,
       salary,
       ROUND(salary * 1.17, 2) AS "NEW SALARY",
       salary * 0.17           AS "INCREASE"
FROM employees
ORDER BY "INCREASE" DESC;

-- nomor 6
SELECT last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS WORKED"
FROM employees
ORDER BY "MONTHS WORKED";

-- nomor 7
SELECT last_name,
       ROUND(MONTHS_BETWEEN(SYSDATE, hire_date) / 12)     AS "TAHUN",
       MOD(ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)), 12) AS "BULAN"
FROM employees
ORDER BY hire_date;
