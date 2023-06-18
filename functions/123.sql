-- delimiter $$
-- create function Ufn_select_5()
-- returns int
-- deterministic
-- begin
--  return(select 5);
-- end$$
-- delimiter ;;
-- select Ufn_select_8();
-- drop function Ufn_select_5;
-- drop function ufn_append_before;
delimiter $$
create function ufn_append_before(str varchar(50))
returns varchar(75)
deterministic
begin
return concat("The ",str);
end$$
delimiter ;
;

select ufn_append_before('test');


delimiter $$
create function ufn_count_employees_by_town(`func_name`varchar(50))
returns int
deterministic
begin
return (
	select count(*) from employees as e
		join addresses as a on e.address_id = a.address_id
		join towns as t on a.town_id = t.town_id
	where t.name = `func_name`
    );
end$$
delimiter ;
;

drop function ufn_count_employees_by_town; -- ("Redmond");
select ufn_count_employees_by_town("Redmond");
select count(*) from employees as e
	join addresses as a on e.address_id = a.address_id
	join towns as t on a.town_id = t.town_id
where t.name = "Redmond";

set @four :=4;
select 5-@four; 
 
 
 delimiter $$
create function ufn_return_var()
returns int
deterministic
begin
declare result int;
set result :=10;

return result;
end$$
delimiter ;
;

select ufn_return_var();  

delimiter $$
create procedure usp_select_emlpoyees()
begin
	select * from employees;
end$$
delimiter ;
;
call usp_select_emlpoyees();
