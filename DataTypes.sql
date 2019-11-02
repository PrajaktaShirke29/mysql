-- Data type
	-- storing Text
		-- varchar =>
        -- char  => has fixed length. lenght is 0 to 255. when stored they are right padded with the spaces to the specified length. when retrieved, trailing spaces are removed unless the PAD_CHAR_TO_FULL_LENGTH sql mode is enambled    => char is faster for fixed length text eg: sex: M/F, Y/N
        
        create database data_type;
        use data_type;
        create table dogs(name char(5), breed varchar(10));
        insert into dogs(name, breed) values ('bob', 'beagle'); 
        insert into dogs(name, breed) values('robby', 'corgi'); 
        insert into dogs(name, breed) values('Jane', 'Retriever');
        insert into dogs(name, breed) values('prin', 'Retriever');
        select * from dogs;
        
        
	-- Numbers
		-- int
        -- decimal: DECIMAL(5,2);
        -- float
        -- double
        
        create table items(price DECIMAL(5, 2));
        INSERT INTO items (price) values (7);
        INSERT INTO items (price) values (784.3);
        INSERT INTO items (price) values (34.76);
        INSERT INTO items (price) values (298.9999);
        INSERT INTO items (price) values (1.9999);
        select * from items;
        
        create table thingies (price float);
        INSERT INTO thingies (price) VALUES (23.44);
        INSERT INTO thingies (price) VALUES (2345556.44);  -- precsion is -7 output => '2345560'
        INSERT INTO thingies (price) VALUES (34254556678779.78);	-- '34254600000000'
        select * from thingies;
        
	-- Dates(yyyy-mm-dd), Times(hh:mm:ss) and dateTime(YYYY-MM-DD HH:MM:SS)
    
		CREATE TABLE people(name VARCHAR(100), birthdate DATE, birthtime TIME, birthDT DATETIME);
        INSERT INTO people (name, birthdate, birthtime, birthDT) values('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
		INSERT INTO people (name, birthdate, birthtime, birthDT) values('Larry', '1983-12-25', '04:10:42', '1983-12-25 04:10:42');
        INSERT INTO people (name, birthdate, birthtime, birthDT) values('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43');
        select * from people;
        
        -- CURDATE() => current date
        -- CURTTIME() => current time
        -- NOW() => current date and time
        
        INSERT INTO people (name, birthdate, birthtime, birthDT) VALUES('blue', CURDATE(), CURTIME(), NOW());
        
        -- DAY()				-- MINITUE()
        -- DAYNAME()			-- MONTHNAME()
        -- DAYOFWEEK()			-- DATE_FORMAT()   Mostly used function
        -- DAYOFYEAR()
        
        SELECT name, birthdate from people;
        select name, birthdate, DAY(birthdate), DAYNAME(birthDT), DAYOFWEEK(birthDT), DAYOFYEAR(birthDT) from people;
        select date_format(birthDT, '%W %M %Y') from people;
        
        -- DATE MATH
        -- DATEDIFF
        -- DATE_ADD
        -- +/-
        
        select DATEDIFF(NOW(), birthdate) from people;
        select birthDT, DATE_ADD(birthDT, interval 1 MONTH)from people;
        select birthDT, birthDT + INTERVAL 15 MONTH + INTERVAL 10 HOUR from people;
        
        -- TIMESTAMPS
        CREATE TABLE comments(content varchar(100), create_at timestamp DEFAULT now());
        INSERT INTO comments(content) values('lol what a funny article');
        INSERT INTO comments(content) values('I found this offensive');
        INSERT INTO comments(content) values('lol wadfcdfsfgfdhjukg');
        select * from comments;
        
        CREATE TABLE comments2(content varchar(100), updated_at timestamp DEFAULT now() ON UPDATE CURRENT_TIMESTAMP);
        INSERT INTO comments2(content) values('lol what a funny article');
        INSERT INTO comments2(content) values('I found this offensive');
        INSERT INTO comments2(content) values('lol wadfcdfsfgfdhjukg');
        select * from comments2;
        update comments2 set content = "LOL" where content = "I found this offensive";
        
-- DATATYPE challenge
select current_time();
select current_date();
select dayofweek(now());
select dayname(now());
select date_format(now(), '%m/%d/%Y');
select date_format(now(), '%M %D at %h:%i');
create table tweets(content varchar(100), username VARCHAR(100), created_at DATETIME default now());
INSERT INTO tweets (content, username)VALUES('This my first tweets', 'praju');
INSERT INTO tweets (content, username)VALUES('This my second tweets', 'raj');
select * from tweets;
