-- nomor 1
SELECT employee_id, first_name, job_id, salary
FROM employees;

-- nomor 2
SELECT DISTINCT(job_id)
FROM employees;

-- nomor 3
SELECT employee_id, (first_name || ' ' || last_name) AS "Full Name", hire_date
FROM employees;

-- nomor 4
SELECT employee_id, last_name, (salary * 12) AS "Annual Salary"
FROM employees;

-- nomor 5
SELECT (last_name || ' : 1 bulan gaji = ' || salary) AS "Gaji Perbulan"
FROM employees;

-- nomor 6
DESCRIBE employees;
-- Di oracle SQL Developer. Di sini gak ada.

-- nomor 7a
SELECT *
FROM departments
WHERE department_id IN (10, 20, 50, 60, 80, 90, 110, 190);

-- nomor 7b
SELECT DISTINCT department_id, department_name, manager_id, location_id
FROM departments;

-- nomor 8
SELECT employee_id "Emp #", last_name employee, job_id job, hire_date "Hire Date"
FROM employees;

-- nomor 9
SELECT (
               employee_id || ', ' || first_name || ',' || last_name || ',' || email || ',' ||
               phone_number || ',' || hire_date || ',' || job_id || ',' || salary || ',' ||
               manager_id || ',' || department_id
           ) AS "THE_OUTPUT"
FROM employees;
