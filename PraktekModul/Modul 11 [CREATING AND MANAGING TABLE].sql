-- nomor 1
CREATE TABLE dept1
(
    id   NUMBER(7)
        CONSTRAINT dept1_id_pk PRIMARY KEY,
    name VARCHAR2(25)
);

DESC dept1;

-- nomor 2
INSERT INTO dept1 (id, name)
SELECT department_id, department_name
FROM departments;

-- nomor 3
CREATE TABLE emp1
(
    id         NUMBER(7)
        CONSTRAINT emp1_id_pk PRIMARY KEY,
    last_name  VARCHAR2(25),
    first_name VARCHAR2(26),
--     dept_id NUMBER(7), FOREIGN KEY (dept_id) REFERENCES dept1(id)
    dept_id    NUMBER(7)
        REFERENCES dept1 (id)
);

DESC emp1;

-- nomor 4
ALTER TABLE emp1
    MODIFY first_name VARCHAR2(50);

DESCRIBE emp1;

-- nomor 5
CREATE TABLE emp2
AS
SELECT employee_id   AS id,
       first_name,
       last_name,
       salary,
       department_id AS dept_id
FROM employees;


DESC emp2;

-- nomor 6
DROP TABLE emp1;

-- nomor 7
RENAME emp2 TO staff;

-- nomor 8
ALTER TABLE staff
    DROP COLUMN first_name;

DESC staff;

-- nomor 10
ALTER TABLE emp2
ADD CONSTRAINT emp2_id_pk PRIMARY KEY (id);

CREATE TABLE dept2
(
    department_id   NUMBER(10)
        CONSTRAINT dept2_id_pk PRIMARY KEY NOT NULL,
    department_name VARCHAR2(30)           NOT NULL,
    manager_id      NUMBER(10)
        REFERENCES emp2 (id),
    location_id     NUMBER(10)             NOT NULL
);

-- nomor 11
DROP TABLE emp2;

-- nomor 12
DROP TABLE dept2;

-- nomor 13
DROP TABLE emp2;

SELECT *
FROM staff;
