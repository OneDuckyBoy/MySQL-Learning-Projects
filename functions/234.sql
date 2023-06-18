set global log_bin_trust_function_creators = 1;
set sql_safe_updates = 0;

-- 1
delimiter $$
create procedure usp_get_employees_salary_above_35000()
begin
select first_name,last_name
from employees
where salary >35000
order by first_name,last_name,employee_id;

end$$
delimiter ;


call usp_get_employees_salary_above_35000;

-- 2
delimiter $$
create procedure usp_get_employees_salary_above(salary_limit double(19,4))
begin
select first_name,last_name
from employees
where salary >= salary_limit
order by first_name,last_name,employee_id;
end$$
delimiter ;

call usp_get_employees_salary_above(45000);

-- 3
delimiter $$
create procedure usp_get_towns_starting_with(starting_with varchar(50))
begin
select name as town_name from towns
where name like concat(starting_with,'%')
order by name;
end $$
delimiter ;
drop procedure usp_get_towns_starting_with;

call usp_get_towns_starting_with("b");

-- 4
delimiter $$
create procedure usp_get_employees_from_town(town_name_var varchar(50))
begin
select e.first_name, e.last_name from employees as e
join addresses as a on e.address_id = a.address_id
join towns as t on a.town_id = t.town_id
where t.name = town_name_var
order by e.first_name;
end$$
delimiter ;
call usp_get_employees_from_town("Sofia");

-- 5
delimiter $$
create function ufn_get_salary_level(level_of_salary double(19,2))
returns varchar(50)
deterministic
begin
	
   return(select case
	when level_of_salary < 30000 then "Low"
    when level_of_salary between 30000 and 50000 then "Average"
    when level_of_salary > 50000 then "High"
    end as salary_Level
    from level_of_salary);
    
end$$
delimiter ;
select salary, ufn_get_salary_level(salary) from employees;
drop function ufn_get_salary_level;
delimiter $$
create function ufn_get_salary_level(level_of_salary double(19,2))
returns varchar(7)
deterministic
begin
	
   return( 
   case
		when level_of_salary < 30000 then "Low"
		when level_of_salary between 30000 and 50000 then "Average"
		when level_of_salary > 50000 then "High"
    end
    );
    
end$$
delimiter ;
select round(salary,2) as salary,ufn_get_salary_level(salary) from employees;



select ufn_get_salary_level(employees.salary) from employees;$$

-- 6
 -- High

delimiter $$
-- create procedure usp_get_employees_by_salary_level(level_of_salary varchar(7) )
-- begin
-- select e.first_name, e.last_name from employees as e
-- where ufn_get_salary_level(e.salary) =level_of_salary
-- order by e.first_name desc, e.last_name desc;
-- end $$
-- delimiter ;
-- ;
-- 7
delimiter ;-- $$
create function  ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
returns int
begin
-- set @regex :="["+set_of_letters+"]*";
SET @res := if (word REGEXP concat("[",set_of_letters,"]*"),1,0);

return(
@res
)
end;
delimiter ;


select case
when "Joe" like "[Jeoade]*" then 1
		else  0
        end 
;
select if ("Joe" REGEXP "[Jeoade]*",1,0) as  result;
