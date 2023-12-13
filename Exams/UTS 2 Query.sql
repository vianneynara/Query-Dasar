-- JAWWABN USIP 2

-- Nr. 1
-- Buatlah query untuk menampilkan first name sebagai NAMA PEGAWAI, department name sebagai DEPARTEMEN,
-- location id sebagai LOKASI, dan city sebagai KOTA dari employee yang memiliki komisi.
SELECT first_name      AS "Nama Pegawai",
       department_name AS "Departemen",
       d.location_id   AS "Lokasi",
       city            AS "kota"
FROM employees e
         LEFT JOIN departments d ON e.department_id = d.department_id
         LEFT JOIN locations l ON d.location_id = l.location_id
WHERE commission_pct IS NOT NULL;

-- Nr. 2
-- Buatlah laporan untuk HR Department yang menampilkan department id sebagai DEPARTEMEN, last name sebagai NAMA,
-- dan semua employee yang bekerja di dalam departemen yang sama dengan employee tersebut (beri nama kolom sebagai
-- KOLEGA). Kerjakan menggunakan Join dengan klausa ON, dan urutkan data berdasarkan nomor department karyawan.
SELECT e1.department_id AS "Departemen",
       e1.first_name || ' ' || e1.last_name     AS "Nama",
       e2.first_name || ' ' || e2.last_name    AS "Kolega"
FROM employees e2
         JOIN employees e1 ON e1.department_id = e2.department_id
WHERE e1.department_id = e2.department_id
ORDER BY "Departemen";

-- Nr. 3
-- Buatlah query untuk menampilkan nama dan tanggal masuk kerja dari setiap karyawan yang masuk kerja setelah
-- “Davies”. Urutkan data berdasarkan hire date.
SELECT first_name || ' ' || last_name AS "Nama",
       TO_CHAR(hire_date)             AS "Tanggal Masuk"
FROM employees
WHERE hire_date > (SELECT hire_date
                   FROM employees
                   WHERE last_name = 'Davies')
ORDER BY hire_date;

-- Nr. 4
-- Tampilkan nomor manager dan gaji tertinggi karyawan yang dibawahi manager tersebut. Tampilkan hanya karyawan
-- yang memiliki manager dan gaji diatas $5000.
SELECT manager_id  AS "Nomor Manager",
       MAX(salary) AS "Gaji Tertinggi"
FROM employees
WHERE manager_id IS NOT NULL
  AND salary > 5000
GROUP BY manager_id
ORDER BY "Gaji Tertinggi";

-- SELECT m.employee_id  AS "Nomor Manager",
--        MAX(e.salary) AS "Gaji Tertinggi"
-- FROM employees m, employees e
-- WHERE m.employee_id = e.manager_id
--   AND e.salary > 5000
-- GROUP BY m.employee_id
-- ORDER BY "Gaji Tertinggi";

-- SELECT m.employee_id  AS "Nomor Manager",
--        MAX(e.salary) AS "Gaji Tertinggi"
-- FROM employees m, employees e
-- WHERE m.employee_id = e.manager_id
--   AND m.salary > 5000
-- GROUP BY m.employee_id
-- ORDER BY "Gaji Tertinggi";

SELECT salary
FROM employees
WHERE employee_id IN (SELECT UNIQUE manager_id
                      FROM employees)
ORDER BY salary;

-- Nr. 5
-- Buatlah query untuk menampilkan nomor departemen, total penghasilan dan penghasilan rata-rata dari masing-
-- masing departemen. Beri nama alias dan bulatkan penghasilan rata-rata. Urutkan berdasarkan rata-rata penghasilan
-- dari yang terbesar.
SELECT department_id      AS "Nomor Departemen",
       MAX(salary)        AS "Total Penghasilan",
       ROUND(AVG(salary)) AS "Penghasilan Rata-rata"
FROM employees
GROUP BY department_id
ORDER BY "Penghasilan Rata-rata" DESC;

-- Nr.6
-- Tampilkan last name, job id dan department id dari karyawan yang memiliki job id yang sama dengan Austin.
SELECT last_name,
       job_id,
       department_id
FROM employees
WHERE job_id IN (SELECT job_id
                 FROM employees
                 WHERE last_name = 'Austin');

-- Nr. 7
-- Memastikan tidak ada tabel Dosen dan Matakuliah
DROP TABLE Dosen;
DROP TABLE Matakuliah;

-- Membuat tabel Dosen
CREATE TABLE Dosen
(
    KodeDosen VARCHAR2(4)
        CONSTRAINT dosen_id_pk PRIMARY KEY NOT NULL,
    NamaDosen Varchar2(40)                 NOT NULL,
    NoHP      VARCHAR2(13)                 NOT NULL,
    Alamat    VARCHAR2(120)                NOT NULL
)

-- Membuat tabel Matakuliahh
CREATE TABLE Matakuliah
(
    KodeMatakuliah  VARCHAR2(6)
        CONSTRAINT matkul_id_pk PRIMARY KEY NOT NULL,
    NamaMatakuliah  Varchar2(40)            NOT NULL,
    SKS             NUMBER(1),
    JP              NUMBER(1),
    KodeDosen       VARCHAR2(4)
        REFERENCES Dosen (KodeDosen)
)

-- delete isi
BEGIN
    DELETE FROM Dosen WHERE 1=1;
    DELETE FROM Matakuliah WHERE TRUE;
    COMMIT;
END;

-- Isi tabel Dosen
BEGIN
    INSERT INTO Dosen VALUES ('D001', 'Andi Sulistiawan', '082112345678', 'Jl paingan');
    INSERT INTO Dosen VALUES ('D002', 'Merry Amelia', '085634215361', 'Jl Krodan');

    COMMIT; -- melakukan transaksi ke DB
END;

-- Isi tabel Matakuliah
BEGIN
    INSERT INTO MataKuliah (KodeMatakuliah, NamaMatakuliah, SKS, JP, KodeDosen) VALUES
    ('INF001', 'Bahasa Query', 1, 3, 'D001');
    INSERT INTO MataKuliah (KodeMatakuliah, NamaMatakuliah, SKS, JP, KodeDosen) VALUES
    ('INF002', 'Struktur Data Linier', 3, 5, 'D002');

    COMMIT; -- melakukan transaksi ke DB
END;

-- Nr. 8
-- Tampilkan employee_id yang tidak memiliki manager_id dengan menggunakan operator himpunan.
-- mengambil query seluruh employee_id pada employees
SELECT employee_id
FROM employees
INTERSECT -- pemotongan untuk mengembalikan records yang bernilai sama diantara 2 query
-- mendapatkan query employee_id yang managernya null
SELECT employee_id
FROM employees
WHERE manager_id IS NULL;