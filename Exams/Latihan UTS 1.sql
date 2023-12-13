-- [1] Tampilkan departemen id, name, manager id, dan location id
SELECT department_id,
       department_name,
       manager_id,
       location_id
FROM departments;

-- [2] Tampilkan last name, salary, dan commission dari semua employee yang memiliki
-- commission
SELECT last_name,
       salary,
       commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- [3] Tampilkan last name dan salary dari employee yang mempunyai penghasilan
-- antara 8000 dan 16000 dalam department 20 atau 50. Beri label kolom dengan nama
-- "Employee" dan "Monthly Salary"
SELECT last_name AS "Employee",
       salary    AS "Monthly Salary"
FROM employees
WHERE (salary BETWEEN 8000 AND 16000)
AND (department_id IN (20, 50));

-- [4] Hitunglah sisa salary dari karyawan denggan job_id PU_CLERK.
-- Sisa salary = salary satu tahun dikurangi 750k untuk jaminan kesehatan
SELECT (salary * 12 - 750) AS "Cut Salary"
FROM employees
WHERE job_id = 'PU_CLERK';

-- [5] Tampilkan last name, job id, department id, hire date, dan urutkan
-- berdasarkan department id
SELECT last_name,
       job_id,
       department_id,
       hire_date
FROM employees
ORDER BY department_id;

-- [6] Tampilkan id, first name, dan last name, sebagai nama lengkap dan
-- hire date dari setiap employee yang bekerja di Toronto, hire date menggunakan
-- format YYYY-MM-DD
SELECT employee_id,
       (first_name || ' ' || last_name) AS "Nama Lengkap",
       TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.city = 'Toronto';

-- [7] Buat query yang dapat menampilkan nama lengkap dari employees beserta
-- idnya, sertakan juga di department mana (id dan nama) DAN job_id, min_salary,
-- dan max_salary
SELECT e.employee_id,
       (e.first_name || ' ' || e.last_name) AS "Nama Lengkap",
       d.department_id,
       d.department_name,
       e.job_id,
       j.min_salary,
       j.max_salary
FROM employees e
         LEFT JOIN departments d ON d.department_id = e.employee_id
         LEFT JOIN jobs j ON j.job_id = e.job_id;

-- [8] Tampilkan employee id, first name, dan department name. Urutkan secara
-- menaik menurut nama department kemudian nama employee. Harus pakai INNER JOIN
SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM employees e
         INNER JOIN departments d ON d.department_id = e.department_id
ORDER BY department_name, first_name;

-- [9] Tampilkan first name, department name, job title, dan max salary yang
-- mulai bekerja pada tahun 2000
SELECT e.first_name,
       d.department_name,
       j.job_title
FROM employees e
         LEFT JOIN departments d ON d.department_id = e.department_id
         LEFT JOIN jobs j ON j.job_id = e.job_id
WHERE e.hire_date >= '01-JAN-2000';

-- Tampilkan nama lengkap dari setiap employees yang tidak memiliki komisi,
-- department name tempat bekerja, dan city departmentnya.
SELECT (first_name || ' ' || last_name) AS "Nama Lengkap",
       d.department_name,
       l.city
FROM employees e
         LEFT JOIN departments d ON e.department_id = d.department_id
         LEFT JOIN locations l ON l.location_id = d.location_id
WHERE e.commission_pct IS NULL;
