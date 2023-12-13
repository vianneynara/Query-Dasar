-- nomor 1 dan 2
CREATE TABLE my_employees
(
    id         NUMBER(4)
        CONSTRAINT emp_id_pk PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name  VARCHAR2(25),
    userid     VARCHAR2(8),
    salary     NUMBER(8, 2)
);

-- nomor 3
INSERT INTO my_employees
VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

-- nomor 4
INSERT INTO my_employees (id, first_name, last_name, userid, salary)
VALUES (2, 'Dance', 'Betty', 'bdance', 860);

-- nomor 5
INSERT INTO my_employees (id, first_name, last_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100);

-- nomor 6
UPDATE my_employees
SET
    last_name = 'Drexler',
    salary = (SELECT e.salary FROM employees e WHERE e.employee_id = 120)
WHERE id = 3;

-- nomor 7
UPDATE my_employees
SET
    salary = 1000
WHERE salary < 900;

-- nomor 8
DELETE
FROM my_employees
WHERE last_name = 'Betty';

SELECT *
FROM my_employees;