
-- 21.	Find the movies whose price is greater than 150 and less than or equal to 200.

SELECT title FROM movie WHERE price > 150 AND price <= 200;

-- 22.	Find the movies that cost more than 150 and also find the new cost as original cost * 15.

SELECT title, price, price * 15 AS new_cost FROM movie WHERE price > 150;

-- 23.	Rename the new column in the above query as new-price.

SELECT title, price, price * 15 AS "new-price" FROM movie WHERE price > 150;

-- 24.	List the movies in sorted order of their titles.

SELECT title FROM movie ORDER BY title;
-- 25.	Print the names and types of all the movie except horror movies.

SELECT title, type FROM movie WHERE type != 'horror';
-- 26.	Divide the cost of movie 'home alone' by difference between its price and 100.

SELECT title, price, price - 100 AS difference, price / (price - 100) AS division FROM movie WHERE title = 'home alone';

-- 27.	List the names, areas and cust _ id of customers without phone numbers.

SELECT fname , area, cust_id FROM cust WHERE phone_no IS NULL;
-- 28. 	List the names of customers without lname.

SELECT fname FROM cust WHERE Iname IS NULL;
-- 29.	List the mv - no, title, type of movies whose stars begin with letter 'm'.

SELECT mv_no, title, type FROM movie WHERE star LIKE 'm%';
-- 30.	List the mv-no and inv-no of customers having inv-no less than 'i05'from the Invoice Transaction Table.

SELECT mv_no, inv_no FROM invoice WHERE inv_no < 'i05';
