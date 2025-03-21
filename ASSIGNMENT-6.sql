-- 1.	Find out the movie number which has been issued to 'ivan'.
SELECT mv_no FROM invoice 
WHERE cust_id = 'ivan';

-- 2.	Find the names and movie numbers of all the customers who have been issued a movie.
SELECT c.fname, c.Iname, i.mv_no 
FROM invoice i
JOIN cust c ON i.cust_id = c.cust_id;

-- 3.	Select the title, cust - id, mv - no for all the movies that are issued.
SELECT m.title, i.cust_id, i.mv_no 
FROM invoice i 
JOIN movie m ON i.mv_no = m.mv_no;

-- 4.	Find out the title and types of the movies that have been issued to 'Vandana'.
SELECT m.title, m.type 
FROM movie m
JOIN invoice i ON m.mv_no = i.mv_no
WHERE i.cust_id = 'vandana';

-- 5.	Find the names of customers who have been issued movie of type 'drama'.
SELECT DISTINCT c.fname, c.Iname 
FROM cust c
JOIN invoice i ON c.cust_id = i.cust_id
JOIN movie m ON i.mv_no = m.mv_no
WHERE m.type = 'drama';

-- 6.	Display the title, lname, fname for customers having movie number greater than or equal to three, in the following format:
SELECT CONCAT('The movie taken by ', c.fname, ' ', c.Iname, ' is ', m.title) AS movie_info
FROM movie m
JOIN invoice i ON m.mv_no = i.mv_no
JOIN cust c ON i.cust_id = c.cust_id
WHERE m.mv_no >= 3;

-- 7. 	Find out which customers have been issued movie number 9.
SELECT c.fname, c.Iname 
FROM cust c
JOIN invoice i ON c.cust_id = i.cust_id
WHERE i.mv_no = 9;

-- 8.	Find the customer name and area with invoice number 'i10'.
SELECT c.fname, c.Iname, c.area 
FROM cust c
JOIN invoice i ON c.cust_id = i.cust_id
WHERE i.inv_no = 'i10';

-- 9.	Find the customer names and phone numbers who have been issued movies before the month of August.
SELECT DISTINCT c.fname, c.Iname, c.phone_no 
FROM cust c
JOIN invoice i ON c.cust_id = i.cust_id
WHERE MONTH(i.issue_date) < 8;

-- 10.	Find the name of the movie issued to 'vandana' and 'ivan'.
SELECT DISTINCT m.title 
FROM movie m
JOIN invoice i ON m.mv_no = i.mv_no
WHERE i.cust_id IN ('vandana', 'ivan');

-- 11.	List the movie number, movie names issued to all customers.
SELECT DISTINCT m.mv_no, m.title 
FROM movie m
JOIN invoice i ON m.mv_no = i.mv_no;

-- 12.	Find the type and movie number of movie issued to cust – id 'a01' and 'a02'.
SELECT m.type, m.mv_no 
FROM movie m
JOIN invoice i ON m.mv_no = i.mv_no
WHERE i.cust_id IN ('a01', 'a02');

-- 13.	Find out if the movie starring' tom cruise' is issued to any customer and print the custid to whom it is issued.
SELECT i.cust_id 
FROM invoice i
JOIN movie m ON i.mv_no = m.mv_no
WHERE m.star = 'tom cruise';

-- 14.	Find the lname, fname who have been issued movies.
SELECT DISTINCT c.Iname, c.fname 
FROM cust c
JOIN invoice i ON c.cust_id = i.cust_id;

-- 15.	Find the name of customer whose has not issued any movie
SELECT c.fname, c.Iname 
FROM cust c
WHERE c.cust_id NOT IN (SELECT cust_id FROM invoice);
