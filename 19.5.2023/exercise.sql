-- 1
use gringotts;
select count(*) from wizzard_deposits;

-- 2
select max(magic_wand_size) from wizzard_deposits
order by magic_wand_size desc;

-- 3
select  deposit_group ,max(magic_wand_size) as mmws from wizzard_deposits
group by deposit_group
order by mmws ,deposit_group;

-- 4
select deposit_group from wizzard_deposits
group by deposit_group
order by avg(magic_wand_size) asc
limit 1;

-- 5
select deposit_group,sum(deposit_amount) as total_sum from wizzard_deposits
group by deposit_group
order by total_sum asc;

-- 6
select deposit_group,sum(deposit_amount) as total_sum from wizzard_deposits
where magic_wand_creator = 'Ollivander family'
group by deposit_group
order by deposit_group asc;

-- 7
select deposit_group,sum(deposit_amount) as total_sum from wizzard_deposits
where magic_wand_creator = 'Ollivander family'
group by deposit_group
having total_sum<150000
order by total_sum desc;

-- 8
select deposit_group,magic_wand_creator,min(deposit_charge) as min_deposit_charge from wizzard_deposits
group by deposit_group,magic_wand_creator
order by magic_wand_creator asc, deposit_group;

-- 9
SELECT 
    CASE
        WHEN age > 0 AND age <= 10 THEN '[0-10]'
        WHEN age > 10 AND age <= 20 THEN '[11-20]'
        WHEN age > 20 AND age <= 30 THEN '[21-30]'
        WHEN age > 30 AND age <= 40 THEN '[31-40]'
        WHEN age > 40 AND age <= 50 THEN '[41-50]'
        WHEN age > 50 AND age <= 60 THEN '[51-60]'
        WHEN age > 60 THEN '[61+]'
    END AS age_1,
    COUNT(*) as count
FROM
    wizzard_deposits
GROUP BY age_1
order by count;

-- 10
select substring(first_name,1,1) as first_letter from wizzard_deposits
where deposit_group = "Troll Chest"
group by first_letter
order by first_letter;

-- 11
select `deposit_group`, `is_deposit_expired`,avg(deposit_interest) from `wizzard_deposits`
where `deposit_start_date`>'1985-01-01'
group by `deposit_group`,`is_deposit_expired`
order by deposit_group desc,is_deposit_expired asc;

-- 12
use soft_uni;
select department_id,min(salary) as"minimum_salary" from employees
where department_id in (2,5,7)
group by department_id
order by department_id asc;

-- 13
create table high_paid_employees as
 select *
 from employees
where salary>30000;

select * from high_paid_employees;
delete from `high_paid_employees`
 where manager_id = 42;
 update high_paid_employees
 set salary= salary+5000
 where department_id = 1;
 
 select department_id,avg(salary) as "avg_salary" from high_paid_employees
 group by department_id
 order by department_id;
 
 -- 14
 select department_id, max(salary) as max from employees
 
 group by department_id
 having max not between 30000 and 70000 
 order by department_id;
 
 -- 15
 select * from employees;
 select count(salary) as "" from employees
 where manager_id is null;
 
 -- 16
 select department_id,(
	select salary from employees e2
	where e1.department_id = e2.department_id
    order by salary desc
    limit 1 offset 2
 ) as third_highest_salary from employees e1
 group by department_id
 order by department_id
 ;
 
 -- 17
 select first_name, last_name, department_id from employees e1
 where salary > (
	select avg (salary) from employees e2
    where e1.department_id = e2.department_id)
    order by department_id ,employee_id
    limit 10;
 
 -- 18
 select department_id, sum(salary) from employees
 group by department_id
 order by department_id;
 