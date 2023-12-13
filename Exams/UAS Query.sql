-- nomor 1
SELECT first_name,
       department_name,
       location_id,
       city
FROM employees
    JOIN departments using (department_id)
    JOIN locations using (location_id)
WHERE commission_pct IS NOT NULL;

-- nomor 2
SELECT first_name,
       salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Rogers');

-- nomor 3
SELECT employee_id,
       first_name,
       job_id,
       salary
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 141)
AND salary > (SELECT salary
                FROM employees
                WHERE employee_id = 104);

-- nomor 4
SELECT department_id,
       MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                      FROM employees
                      WHERE department_id = 50);

-- getting the min salary of department id 50
SELECT MIN(salary)
FROM employees
HAVING department_id = 50 -- WHERE department_id = 50;
GROUP BY department_id;

-- all
SELECT department_id,
       MIN(salary)
FROM employees
GROUP BY department_id;

-- nomor 5
SELECT MIN(salary),
       MAX(salary),
       SUM(salary),
       AVG(salary)
FROM employees
GROUP BY job_id;

-- nomor 6
SELECT department_id,
       AVG(salary)
FROM employees
GROUP BY department_id;

-- nomor 7
SELECT job_id,
       SUM(salary)
FROM employees
GROUP BY job_id
HAVING SUM(salary) > 10000;

-- nomor 8a: NATURAL JOIN
SELECT employee_id,
       first_name,
       last_name,
       department_id,
       department_name
FROM employees
    NATURAL JOIN departments
WHERE department_name = 'IT';

-- nomor 8b: JOIN dengan USING
SELECT employee_id,
       first_name,
       last_name,
       department_id,
       department_name
FROM employees
    JOIN departments USING (department_id)
WHERE department_name = 'IT';

-- nomor 8c: JOIN dengan ON
SELECT employee_id,
       first_name,
       last_name,
       e.department_id,
       department_name
FROM employees e
    JOIN departments d ON (e.department_id = d.department_id)
WHERE department_name = 'IT';

-- nomor 9
CREATE TABLE TUTOR
(
    kode_tutor VARCHAR2(6)
        CONSTRAINT tutor_PK PRIMARY KEY,
    nama_tutor VARCHAR2(50)
        CONSTRAINT nama_tutor_NN NOT NULL,
    golongan VARCHAR2(2)
        CONSTRAINT golongan_tutor_NN NOT NULL,
    pendidikan VARCHAR2(20)
        CONSTRAINT pendidikan_tutor_NN NOT NULL
)

CREATE TABLE COURSE
(
    kode_course VARCHAR2(5)
        CONSTRAINT course_PK PRIMARY KEY,
    nama_course VARCHAR2(50)
        CONSTRAINT nama_course_NN NOT NULL,
    jam NUMBER(3),
    kode_tutor VARCHAR2(6)
        REFERENCES tutor (kode_tutor)
)

SELECT *
FROM tutor;

SELECT *
FROM course;

DROP TABLE tutor;
DROP TABLE course;

-- nomor 10
BEGIN
    INSERT INTO tutor
    VALUES ('P.1234', 'Yohanes Maria Vianney Nara Narwandaru', '3A', 'S1 Informatika');

    INSERT INTO tutor (kode_tutor, nama_tutor, golongan, pendidikan)
    VALUES ('P.2345', 'Septian Alvaro', '4B', 'S2 Mekatronika');


    INSERT INTO course
    VALUES ('C-102', 'JAVA', '25', 'P.1234');

    INSERT INTO course (kode_course, nama_course, jam, kode_tutor)
    VALUES ('C-203', 'Robotika', 30, 'P.2345');

    commit;
END;

SELECT *
FROM tutor;

SELECT *
FROM course;