-- 1
SELECT 
    department_id,count(id)
FROM
    employees
GROUP BY department_id
order by department_id;

-- 2
SELECT 
    department_id,round(avg(salary),2) as `Average Salary`
FROM
    employees
GROUP BY department_id
order by department_id;

-- 3
SELECT 
    department_id,round(min(salary),2) as `Min Salary`
FROM
    employees

GROUP BY department_id
having min(salary)>800;

-- 4 
select count(name) from products
where price>8.0 and category_id =2;	

-- 5
select category_id, round(avg(price),2),round(min(price),2),round(max(price),2)
	from products
    group by category_id;
