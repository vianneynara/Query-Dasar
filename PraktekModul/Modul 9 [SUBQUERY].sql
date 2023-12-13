-- nomor 1:
-- Buatlah query untuk menampilkan last name dan hire date dari employee yang
-- satu department dengan Zlotkey. Jangan sertakan Zlotkey!
SELECT last_name,
       hire_date
FROM employees
WHERE department_id = (SELECT department_id
                       FROM employees
                       WHERE last_name = 'Zlotkey')
AND last_name <> 'Zlotkey';

-- nomor 2:
-- Tampilkan nomor employee, last name, salary untuk semua employee yang
-- mempunyai salary lebih tinggi dari rata-rata salary. Urutkan hasil berdasarkan
-- salary secara ascending.
SELECT employee_id,
       last_name,
       salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary ASC;

-- nomor 3:
-- Buatlah query untuk menampilkan nomor employee dan last name seluruh
-- employee yang bekerja dalam satu department yang sama dengan setiap
-- employee yang memiliki last name mengandung huruf u.
SELECT employee_id,
       last_name
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE last_name LIKE '%u%'
                        OR last_name LIKE '%U%');

-- nomor 4:
-- Buatlah query untuk menampilkan last_name, department number, dan job id
-- untuk seluruh karyawan yang departemen nya memiliki location id = 1700.
SELECT last_name,
       department_id,
       job_id
FROM employees
WHERE department_id IN (SELECT d.department_id
                        FROM departments d
                        WHERE location_id = 1700);

-- nomor 5:
-- Buatlah query untuk menampilkan last name dan salary untuk setiap employee
-- yang memiliki manager King.
SELECT last_name,
       salary
FROM employees
WHERE manager_id IN (SELECT employee_id
                    FROM employees
                    WHERE last_name = 'King');

-- nomor 6:
-- Buatlah query untuk menampilkan nomor department, last name, dan job id
-- untuk setiap karyawan yang bekerja di Department Executive.
SELECT department_id,
       last_name,
       job_id
FROM employees
WHERE department_id = (SELECT d.department_id
                       FROM departments d
                       WHERE department_name = 'Executive');