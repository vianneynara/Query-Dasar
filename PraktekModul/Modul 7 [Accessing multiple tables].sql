-- NOMOR 1
-- Buatlah query menggunakan NATURAL JOIN untuk menampilkan alamat semua
-- departemen. Gunakan table LOCATIONS dan COUNTRIES. Tampilkan location ID,
-- street address, city, state province dan country.
SELECT
    l.location_id,
    l.street_address,
    l.city,
    l.state_province,
    c.country_name
FROM locations l NATURAL JOIN countries c;

-- NOMOR 2
-- Buatlah query untuk menampilkan last_name, department_id, dan
-- department_name untuk semua pegawai.
-- 2A: Gunakan JOIN dengan klausa USING
SELECT
    e.last_name,
    department_id,      -- digunakan dalam USING, tidak perlu prefix
    d.department_name
FROM employees e JOIN departments d USING (department_id);

-- 2B: Gunakan JOIN dengan klausa ON
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e JOIN departments d ON e.department_id = d.department_id;

-- NOMOR 3
-- Buatlah query untuk menampilkan last_name, job, department number, dan
-- department name untuk seluruh karyawan yang bekerja di Toronto.
-- 3A: Gunakan NATURAL JOIN
SELECT
    last_name,
    job_id,
    department_id,
    department_name
FROM employees
    NATURAL JOIN (departments NATURAL JOIN locations)
WHERE city = 'Toronto';

-- 3B: Gunakan JOIN dengan klausa USING
SELECT
    last_name,
    job_id,
    department_id,
    department_name
FROM employees
    JOIN departments USING (department_id)
    JOIN locations USING (location_id)
WHERE city = 'Toronto';

-- 3C: Gunakan JOIN dengan klausa ON
SELECT
    last_name,
    job_id,
    e.department_id,
    department_name
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
WHERE city = 'Toronto';

-- NOMOR 4
-- Buatlah query untuk menampilkan last name dan number setiap employee
-- beserta dengan last name dan number manajernya, dengan format tampilan
-- seperti di bawah ini! Gunakan label kolom EMPLOYEE, EMP#, Manager, Mgr#.
-- Gunakan JOIN dengan klausa ON !
SELECT
    e.last_name AS "Employee",
    e.employee_id AS "EMP#",
    m.last_name AS "Manager",
    e.manager_id AS "Mgr#"
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id);

-- NOMOR 5
-- Buatlah query untuk menampilkan last name, department name, location ID,
-- dan city dari employee yang mendapatkan commission. Gunakan JOIN dengan
-- klausa ON.
SELECT
    employee_id,
    commission_pct,
    last_name,
    department_name,
    d.location_id,
    city
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
WHERE commission_pct IS NOT NULL;
