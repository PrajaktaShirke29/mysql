-- logical operation
use book_shop;

-- equal
select title, released_year from books where released_year = 2017;
-- Not equal
select title, released_year from books where released_year != 2017;
select title, author_lname from books where author_lname != 'harries';

-- LIKE
select title, author_fname from books where author_fname LIKE '%da%';
-- NOT LIKE
select title, author_fname from books where author_fname NOT LIKE '%da%';

-- greater than
select title, released_year from books where released_year > 2000 order by released_year;
-- greater than and equal to
select title, released_year from books where released_year >= 2000 order by released_year;

	-- small 
    select 9<1;		-- 0 
    select 100 > 5;	 -- 1
    select -15 > 15;	-- 0
	select 9> -10;		-- 1
    select 1 > 1;		-- 0
	select 'a'>'b';		-- 0
    select 'A'> 'a';	-- 0

-- Less than
select title, released_year from books where released_year < 2000 order by released_year;
-- less than and equal to
select title, released_year from books where released_year <= 2000 order by released_year;
	-- small example
    select 3 < -10; 	-- 0
    select -10< -9; 	-- 1
    select 42 <= 42;	-- 1
    select 'h' < 'p';	-- 1
    select 'Q' <= 'q';	-- 1

-- Logical AND (&&)
select * from books where concat(author_fname, ' ', author_lname) = 'Dave Eggers' && released_year >= 2010;		-- OR --
select * from books where concat(author_fname, ' ', author_lname) = 'Dave Eggers' AND released_year >= 2010;
	-- small example
    select 1<5 && 7=9; 		-- 0
    select -10> -20 && 0<=0;	-- 1
    select -40<= -0 AND 10 > 40;	-- 0
    select 54 <= 54 && 'a'='A';	-- 1

-- Logical OR (||)
select * from books where concat(author_fname, ' ', author_lname) = 'Dave Eggers' || released_year >= 2010;		-- OR --
select * from books where concat(author_fname, ' ', author_lname) = 'Dave Eggers' OR released_year >= 2010;
	-- small Example
    select 40 <= 100 || -2>0;		-- 1
    select 10>5 || 5=5;				-- 1
    select 'a'=5 || 3000>2000;		-- 1
    
-- Between AND not between
select title, released_year from books where released_year >= 2004 && released_year <= 2015;
select title, released_year from books where released_year BETWEEN 2004 AND 2015;
select title, released_year from books where released_year NOT BETWEEN 2004 AND 2015;
select cast('2018-09-12' AS DATETIME);

-- IN and NOT IN
select title, author_lname from books where author_lname IN ('caver', 'Lahiri', 'smith');
select title, released_year FROM books WHERE released_year >= 2000 && released_year NOT IN (2000, 2002, 2004, 2008, 2006, 2010, 2012, 2014, 2016);
select title, released_year FROM books where (released_year % 2) != 0 && released_year>= 2000;

-- case statement
SELECT title, released_year, CASE when released_year >= 2000 THEN 'modern List' else '20th century list' End as Genre from books;
select title, stock_quantity, case when stock_quantity between 0 AND 50 then '*' when stock_quantity BETWEEN 51 AND 100 then '**' ELSE '***' End as stocks from books;
select title, stock_quantity, case when stock_quantity <= 50 then '*' when stock_quantity <= 100 then '**' ELSE '***' End as stocks from books;

-- Logical operation challenge
select 10 != 10;  	-- 0
select 15 > 14 && 99-5 <= 94;	-- 1
select 1 IN (5,3) || 9 BETWEEN 8 AND 10; 	-- 1
select * from books where released_year < 1980;
select * FROM books WHERE author_lname IN ('Eggers', 'Chabon');
select * from books where author_lname = 'lahiri' && released_year > 2000;
select * from books where pages BETWEEN 100 AND 200;
select * from books where author_lname LIKE 'c%' OR author_lname Like 'S%';
select title, author_lname, case when title Like '%stories%' then 'Short Stories' when title IN ('just kids', 'A Heartbreaking Work of Staggering Genius') then 'Memoir' else 'Novel' END As type from books;
select title, author_lname, case when count(*) = 1 then concat(count(*), ' Book') else concat(count(*), ' Books') END as count from books group by author_lname;
