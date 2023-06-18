
-- 1
select title from book_library.books
where substring(title,1,3)='The'
order by id;

-- 2
select replace( title,'The','***') as title from books 
where substring(title,1,3)='The'
order by id;

-- 3
select round(sum(cost),2) from books;

-- 4
select concat_ws(' ',first_name,last_name) as 'Full Name' ,timestampdiff(day,born,died) as 'Days Lived' from authors;

-- 5
select title from books
where title like 'Harry Potter%';
;

-- d
select REPEAT('JOE',2);

select 5 div 2, 5/2,5%2,5 mod 2;

select pi();
select abs(5),abs(-5);
select sqrt(4),pow(4,2);

select conv(13,10,2), conv(1101, 2,10);

select round(2.356,2),floor(2.356),ceil(2.356),round(-2.356,2),floor(-2.356),ceil(-2.356);

select sign(-123);


select concat_ws(' ',first_name,last_name) as 'Full Name' ,timestampdiff(day,born,died) as 'Days Lived' from authors