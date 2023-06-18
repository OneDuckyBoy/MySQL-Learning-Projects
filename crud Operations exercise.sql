use soft_uni;

-- 1
SELECT 
    *
FROM
    departments
ORDER BY department_id;

-- 2
SELECT 
    name
FROM
    departments
ORDER BY department_id;

-- 3 
SELECT 
    first_name, last_name, salary
FROM
    employees
ORDER BY employee_id;
-- 4
select first_name, middle_name,last_name from employees
ORDER BY employee_id;

-- 5
select concat(first_name,'.',last_name,'@softuni.bg')as 'full_email_address' from employees;

-- 6
select Distinct salary  from employees;

-- 7
select * from employees
where job_title ='Sales Representative'
order by employee_id;

-- 8
select first_name,last_name,job_title from employees
where salary between 20000 and 30000
ORDER BY employee_id;

-- 9
select concat_ws(' ',first_name,middle_name,last_name) as 'Full Name' from employees
where salary in  (25000,14000,12500,23600);

-- 10
select first_name,last_name from employees
where manager_id is null;

-- 11
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > 50000
ORDER BY salary DESC;

-- 12
SELECT 
    first_name, last_name
FROM
    employees
ORDER BY salary DESC
limit 5;

-- 13
SELECT 
    first_name, last_name
FROM
    employees
    where department_id != 4;

-- 14
select * from employees
order by salary desc ,first_name,last_name desc,middle_name, employee_id;

-- 15
create view v_employees_salaries as
select first_name,last_name,salary from employees;
select * from v_employees_salaries;

-- 16
use soft_uni;
create view v_employees_job_titles as
select concat(first_name, ' ',if(middle_name is null,'',(middle_name,' ')),last_name),job_title from employees;
select * from v_employees_job_titles; 
drop view v_employees_job_titles;

-- 17
select distinct job_title from employees
order by job_title;

-- 18
SELECT * FROM soft_uni.projects
order by start_date,name,project_id
limit 10;

-- 19
select first_name,last_name,hire_date from employees
order by hire_date desc
limit 7;

-- 20
update employees
set salary =salary*1.12
where department_id in (1,2,4,11);
select salary from employees;

-- 21
use geography;
select peak_name from peaks
order by peak_name;

-- 22
select country_name,population from countries
where continent_code = 'EU'
order by population desc,country_name
limit 30;

-- 23
select country_name,country_code,if(currency_code='eur','Euro','Not Euro') as currency from countries

order by country_name;


