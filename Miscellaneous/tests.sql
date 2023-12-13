select FIRST_NAME || ' ' || EMPLOYEES.LAST_NAME as Name
from EMPLOYEES
order by first_name || ' ' || last_name asc;

select LAST_NAME, SALARY, COMMISSION_PCT
from EMPLOYEES
where (COMMISSION_PCT is null)
order by SALARY desc, COMMISSION_PCT desc;