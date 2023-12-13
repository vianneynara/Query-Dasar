-- nomor 1
SELECT
    (
        last_name ||
         ' mendapat ' ||
         to_char(salary, 'fm$99,999.00') ||
         ' perbulan tetapi menginginkan ' ||
         to_char(salary, 'fm$99,999.00') ||
         '.'
    ) AS "dream salaries"
FROM employees;

-- nomor 2
SELECT
    last_name,
    hire_date,
    to_char(hire_date, 'DAY') AS DAY
FROM employees
ORDER BY to_char(hire_date, 'D');

-- nomor 3
SELECT
    last_name,
    hire_date,
    (
        to_char(
            next_day(add_months(hire_date, 6), 'Monday'),
            'fmDay, "the" fmDdspth "of" fmMonth", "YYYY'
        )
    ) AS REVIEW
FROM employees;

-- nomor 4
SELECT nvl(to_char(commission_pct), 'No Commission') as COMMISION from employees;

-- nomor 5
SELECT
    last_name,
    job_id,
    decode(job_id,
        'AD_PRES',  'A',
        'ST_MAN',   'B',
        'IT_PROG',  'C',
        'SA_REP',   'D',
        'ST_CLERK', 'E',
    '0') AS GRADE
FROM employees;

-- nomor 6
SELECT
    last_name,
    job_id,
    CASE job_id
        WHEN 'AD_PRES'  THEN 'A'
        WHEN 'ST_MAN'   THEN 'B'
        WHEN 'IT_PROG'  THEN 'C'
        WHEN 'SA_REP'   THEN 'D'
        WHEN 'ST_CLERK' THEN 'E'
        ELSE '0'
    END AS GRADE
from employees;
