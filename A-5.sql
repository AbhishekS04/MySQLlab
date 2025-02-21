

-- 1.	Calculate the square root of the price of each movie.

SELECT title, SQRT(price) AS price FROM movie;
 
-- 2.	Count the total number of customers.

SELECT COUNT(*) AS total_customers FROM cust;

-- 3.	Calculate the total price of all the movies.

SELECT SUM(price) AS total_price FROM movie;

-- 4.	Calculate the average price of all the movies.

SELECT AVG(price) AS average_price FROM movie;

-- 5.	Determine the maximum and minimum movie prices.  Rename the title as max-price and min_price respectively.

SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM movie;

-- 6.	Count the number of movies having price greater than or equal to 150.

SELECT COUNT(*) AS movies_greater_than_150 FROM movie WHERE price >= 150;

-- 7.	Print the type and average price of each movie.

SELECT type, AVG(price) AS average_price FROM movie GROUP BY type;

-- 8.	Find the number of movies in each type.

SELECT type, COUNT(*) AS number_of_movies FROM movie GROUP BY type;

-- 9.	Count separately the number of movies in the 'comedy' and 'thriller' types.

SELECT type, COUNT(*) AS number_of_movies FROM movie WHERE type = 'comedy' OR type = 'thriller' GROUP BY type;

-- 10.	Calculate the average price for each type that has a maximum price of 150.00.

SELECT type, AVG(price) AS average_price FROM movie WHERE price <= 150 GROUP BY type;

-- 11. 	print the total number of movies for each type

SELECT type, COUNT(*) AS number_of_movies FROM movie GROUP BY type;

-- 12. 	print the return date of customer a02 in the following format - the return date of customer a01 is ..........

SELECT 'the return date of customer a01 is ' || return_date FROM invoice WHERE cust_id = 'a01';

-- 13. print the issue date of customer id a01, a02 and a05

SELECT issue_date FROM invoice WHERE cust_id = 'a01' OR cust_id = 'a02' OR cust_id = 'a05';

-- 14. 	print the top three movies according to their price

SELECT title, price FROM movie ORDER BY price DESC LIMIT 3;


-- 15.        Print the title and star of the movie with highest ticket price.

SELECT title, star FROM movie WHERE price = (SELECT MAX(price) FROM movie);


-- 16. 	List the title of the movies according to their price (high to low)

SELECT title FROM movie ORDER BY price DESC;


-- 17. 	print the first name of the customers with exactly 4 characters

SELECT fname FROM cust WHERE LENGTH(fname) = 4;


commit;commit;-- 1.	Calculate the square root of the price of each movie.

SELECT title, SQRT(price) AS price FROM movie;