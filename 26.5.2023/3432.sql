	-- select
-- 		employee_id,
-- 		concat_ws(" ",first_name,last_name) as full_name,
-- 		departments.department_id,
-- 		departments.name # as department_name
-- 	from departments
-- 	inner join employees on departments.manager_id = employees.employee_id
-- 		order by employee_id
-- 		limit 5;
--         
# 2
	select 
		   towns.town_id,
		   `name` as "town_name",
           address_text
	from towns
    join addresses on towns.town_id = addresses.town_id
    where towns.name in ('San Francisco','Sofia','Carnation')
    order by towns.town_id,address_id;
    
# 3
select * from employees;
	SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    ROUND(salary, 0) AS salary
FROM
    employees
WHERE
    manager_id IS NULL;
    
# 4
select count(salary) as count from employees
where salary >(select avg(salary) from employees);
    
    
   select now();