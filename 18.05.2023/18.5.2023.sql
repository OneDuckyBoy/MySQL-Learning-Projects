use soft_uni;

-- 1
select first_name, last_name from employees
where lower(first_name) like "sa%"
order by employee_id;

-- 2
select first_name, last_name from employees
where lower(last_name) like"%ei%"
order by employee_id;

-- 3
select first_name from employees
where department_id in(3,10)
and YEAR(hire_date) between 1995 and 2005
order by employee_id asc;

-- 4
select first_name, last_name from employees
where lower(job_title) not like "%engineer%"
order by employee_id;

-- 5
select `name` from towns
where length(name)=5 or length(name)=6
order by name;

-- 6
-- M, K, B or E
select * from towns
where lower(name) regexp "^[mkbe]"
order by name;

-- 7
select * from towns
where lower(name) not regexp "^[brd]"
order by name;

-- 8
create view v_employees_hired_after_2000 as
select first_name,last_name from employees
where year(hire_date) >2000;
select * from v_employees_hired_after_2000;

-- 9
select first_name,last_name from employees
where length(last_name)=5;

-- 10
use geography;

select country_name, iso_code from countries
where lower(country_name) like "%a%a%a%"
order by iso_code;

-- 11
select peak_name,river_name, lower(concat(peak_name,substring(river_name,2))) as "mix" from rivers, peaks
where lower(SUBSTRING(peak_name,-1)) =lower( SUBSTRING(river_name,1,1));

-- 12
use diablo;
select name,DATE_FORMAT(start, '%Y%m%d') from games
where year(start) between 2011 and 2012
order by start,name
limit 50;

-- 13
select user_name, substring_index(email,"@",-1) as `email provider` from users
order by `email provider`, user_name;

-- 14
-- "___.1%.%.___"
select user_name, ip_address from users
where ip_address like "___.1%.%.___"
order by user_name;

-- 15
select name as game, (case
          when hour(start) < 12 then 'Morning'
          when hour(start) < 18 then 'Afternoon'
          when hour(start) < 24 then 'Evening'
         end) as 'Part of the day',
     (case
         when duration <= 3 then 'Extra short'
         when duration <= 6 then 'Short'
         when duration <= 10 then 'Long'
         else 'Extra long'
         end) as 'Duration'
 from games;

-- 16

