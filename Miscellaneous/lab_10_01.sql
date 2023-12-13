CREATE TABLE my_employees
(
    id         NUMBER(4)
        CONSTRAINT emp_id_pk PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name  VARCHAR2(25),
    userid     VARCHAR2(8),
    salary     NUMBER(8, 2)
);

DESC my_employees;

