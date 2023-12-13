-- nomor 1
-- Buatlah query untuk menampilkan alamat semua departemen. Gunakan table
-- LOCATIONS dan COUNTRIES. Tampilkan location ID, street address, city, state
-- province dan country.
SELECT
    l.location_id,
    l.street_address,
    l.city,
    l.state_province,
    c.country_name
FROM
    departments d, locations l, countries c
WHERE
    d.location_id = l.location_id
    AND l.country_id = c.country_id;

-- nomor 2
-- Buatlah query untuk menampilkan last_name, department_id, dan
-- department_name untuk pegawai yang bekerja di departemen Shipping.
SELECT
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e, departments d
WHERE
    e.department_id = d.department_id
    AND d.department_name = 'Shipping';

-- nomor 3
-- Buatlah query untuk menampilkan last_name, job, department number, dan
-- department name untuk seluruh karyawan yang bekerja di Toronto.
SELECT
    e.last_name,
    e.job_id,
    e.department_id,
    d.department_name
FROM employees e, departments d, locations l
WHERE
    e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND l.city = 'Toronto';

-- nomor 4
-- Buatlah query untuk menampilkan last name dan number setiap employee
-- beserta dengan last name dan number manajernya, dengan format tampilan
-- seperti di bawah ini! Gunakan label kolom EMPLOYEE, EMP#, Manager, Mgr#.
SELECT
    e.last_name Employee,
    e.employee_id EMP#,
    m.last_name Manager,
    m.employee_id Mgr#
FROM
    employees e LEFT JOIN employees m
        ON e.manager_id = m.employee_id
ORDER BY MGR#, EMP#;

-- nomor 5
-- Buatlah query untuk menampilkan last name, department name, location ID,
-- dan city dari employee yang mendapatkan commission.
SELECT
    e.last_name,
    d.department_name,
    l.location_id
--     , l.city
FROM
    employees e LEFT JOIN departments d ON (e.department_id = d.department_id)
        LEFT JOIN locations l ON (l.location_id = d.location_id)
WHERE
    -- filter null commissions
    e.commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;