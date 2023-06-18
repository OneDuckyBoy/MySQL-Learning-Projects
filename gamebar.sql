-- 1

SELECT 
    id AS 'No.',
    concat(first_name,' ',  last_name) as 'Full name',
    job_title AS 'Job title'
FROM
    employees as e
ORDER BY id;

-- 2

select 
	id ,
	concat_ws (' ',first_name,last_name) as 'full_name',
    job_title ,
    salary 
from employees
where salary >1000;

select * from employees
where department_id = 1;

select distinct last_name from employees;

select id, first_name,last_name
from employees
where department_id< 3;

select id, first_name,department_id
from employees
where not (department_id=1) or department_id = 2;

select id, first_name,department_id
from employees
where id between 1 and 5;

select id, first_name,department_id
from employees
where department_id not in (1,32,42,22,2);

SELECT 
    *
FROM
    employees
WHERE
    department_id = 4 AND salary > 1000
ORDER BY id
limit 1;

select *
from employees
order by department_id desc,salary desc;

create view v_top_paid_employee as
select *
from employees
order by salary desc;

select * from v_top_paid_employee;

insert employees values(11,'First','Last','Job',2,1100);

select *
from employees;

insert  into employees (first_name,last_name,job_title,department_id ,salary)
values('George','Mama' ,'Cook',3,2200);

select *
from employees limit 20;


