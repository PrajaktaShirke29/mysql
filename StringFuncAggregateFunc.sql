create database book_shop;
use book_shop;
create table books(book_id int not null primary key auto_increment, title varchar(100), author_fname varchar(100), author_lname varchar(100), released_year int, stock_quantity int, pages int);
Insert into books(title, author_fname, author_lname, released_year, stock_quantity, pages) values ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291), ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304), ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465), ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198), ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352), ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634), ('Just kids', 'Patti', 'Smith', 2010, 55, 304), ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437), ('Coraline', 'Neil', 'Gain', 2003, 100, 208), ('What we talk about when we talk about love: Stories', 'Raymond', 'caver', 1981, 12, 176), ("Where I'm calling From: Selected Stories", 'Raymond', 'Caver', 1989, 12, 526), ('White Noise', 'Don', 'DeLillo', 1985, 49, 320), ('Cannery Row', 'John', 'Steinbeck', 1945, 49, 320), ('Oblivion: Stories', 'David', 'Fostor Wallace', 2004, 172, 329), ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
select * from books;

-- concat string
select concat(author_fname,' ' ,author_lname) as 'Full Name' from books;
select author_fname as 'first name', author_lname as 'last name', concat(author_fname, ' ', author_lname) as 'full name' from books;
select concat_ws('-', title, author_lname, author_fname) as 'Description' from books;

-- substrings
select substr('hello world', 1, 4);		-- hell
select substring('hello world', 7);      -- world
select substring('hello world', -3);  		-- rld
select title from books;
select concat(substring(title,1, 10), '...') as short_title from books;

-- replace string
select replace('hello world', 'hell', '%$#@');  	-- '%$#@o world'
select replace('hello world', 'l', '7');  	-- 'he77o wor7d'
select replace('cheese bread coffee milk', ' ', ' and '); 	-- 'cheese and bread and coffee and milk'
select concat(substring(title, 1, 10), '... ') as 'short title' from books;
SELECT substring(replace(title, 'e', 3), 1, 10) as weirdString from books;

-- reverse String
select reverse('hello world');		-- 'dlrow olleh'
select reverse('meow meow');		-- 'woem woem'
select reverse(author_fname) from books;
select concat('woof', reverse('woof'));  -- 'wooffoow' palindrome
select concat(author_fname, reverse(author_fname)) from books;		-- palindrome

-- Char_length
select char_length('hello world');
select author_lname, char_length(author_lname) from books;
select concat(author_lname, ' is ', char_length(author_lname), ' character long') as characterLength from books; 

-- upper() and lower() case
select upper('hello world');	-- 'HELLO WORLD'
select lower('HELLO WORLD');	-- 'hello world'
select upper(title) from books;
select concat('My favorite book is ', upper(title)) from books;

-- string function challenge
select upper(reverse('Why does my cat look at me with such hatred?'));
select replace(concat('I', ' ', 'like', ' ', 'cats'), ' ', '-');
select replace(title, ' ', ' -> ') as title from books;
select author_lname as forward,  reverse(author_lname) as backwards from books;
select upper(concat(author_fname,' ', author_lname)) as 'full name in caps' from books;
select * from books;
select concat(title, ' was released in ', released_year) as description from books;
select title, char_length(title) as 'character count' from books;
select concat(substring(title, 1, 10), '... ') as 'short title', concat(author_lname, ',', author_fname) as author, concat(stock_quantity, ' in stock. ') as quantity from books;

-- refining our selection
Insert into books (title, author_fname, author_lname, released_year, stock_quantity, pages)values('10% happier', 'Dan', 'Harries', 2014, 29, 256), ('fake_book', 'Freids', 'Harries', 2001, 287, 428), ('Lincoln In The Bado', 'George', 'saunders', 2017, 1000, 367); 

-- Distinct
select distinct(author_lname) from books;
select distinct(released_year) from books;
select distinct author_fname, author_lname from books;
select distinct(concat(author_fname, ' ', author_lname)) from books;

-- order By
select author_lname from books order by author_lname;
select title from books order by title;
select released_year from books order by released_year;
select released_year from books order by released_year DESC;
select released_year from books order by released_year asc;
select title, released_year, pages from books order by released_year;
select title, pages from books order by released_year;
select title, author_fname, author_lname from books order by 2;
select title, author_fname, author_lname from books order by 3;
select title, author_fname, author_lname from books order by 1 DESC;
select title, author_fname, author_lname from books order by 1;
select title, author_fname, author_lname from books order by author_fname, author_lname;

-- Limit
select title, author_fname, author_lname from books order by 2 limit 3;
select title, released_year from books order by released_year DESC limit 5;
select title, released_year from books order by released_year DESC limit 2,5;

-- Like
select title, author_fname, author_lname from books where author_fname like '%da%';		-- % is wildcard
select title, author_fname, author_lname from books where author_fname like 'da%';
select title, author_fname, author_lname from books where author_fname like 'da__';
select title, author_fname, author_lname from books where title like '%\%%';
select title, author_fname, author_lname from books where title like '%\_%';
select title, stock_quantity from books where stock_quantity like '__';

-- refining selection challenge
select title from books where title like '%stories%';
select title, pages from books order by pages desc limit 1;
select concat(title, ' - ', released_year) as summary from books order by released_year desc limit 3;
select title, author_lname from books where author_lname like '% %';
select title, released_year, stock_quantity from books order by stock_quantity limit 3;
select title, author_lname from books order by author_lname, title;
select upper(concat('my favorite author is ', author_fname, ' ', author_lname)) as yell from books order by author_lname; 

-- aggregate function
select count(*) from books;
select count(distinct author_fname, author_lname) from books;
select count(*) from books where title like '%the%';

-- group by
select author_fname, author_lname, count(*) from books group by author_lname, author_fname;
select released_year, count(*) from books group by released_year;
select concat('In ', released_year, ' ',count(*), ' book(s) released') as year from books group by released_year;

-- max and min
select max(pages) from books;
select min(pages) from books;
select title, max(pages) from books;       -- max pages in diff row and title is diff
select title, pages from books where pages = (select max(pages) from books);    -- OR
select title, pages from books order by pages desc limit 1;
select min(released_year) from books;
select author_fname, author_lname, min(released_year) from books group by author_fname, author_lname;
select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;
select concat(author_fname, ' ', author_lname) as author, max(pages) from books group by author_fname, author_lname;

-- sum
select sum(pages) from books;
select title, concat(author_fname, ' ', author_lname) as author, sum(pages) from books group by author_fname, author_lname;

-- avg
select avg(released_year) from books;
select avg(pages) from books;
select released_year, avg(stock_quantity) from books group by released_year;

-- aggregate function challenge
select count(*) from books;
select released_year, count(*) from books group by released_year;
select sum(stock_quantity) from books;
select author_fname, author_lname, avg(released_year) from books group by author_lname, author_fname;
select concat(author_fname, ' ', author_lname) as 'full name', pages from books where pages = (select max(pages) from books); 
select released_year as year, count(*) as books, avg(pages) as 'avg pages' from books group by released_year order by released_year;