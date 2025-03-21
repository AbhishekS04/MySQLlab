-- 1.	Using aggregate function find out the fname of the customer who have issued only one movie.
SELECT fname FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    GROUP BY cust_id
    HAVING COUNT(mv_no) = 1
);

-- 2.	Find out the name(fname,lname) of the customer who have issued only one movie.
SELECT fname, Iname FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    GROUP BY cust_id
    HAVING COUNT(mv_no) = 1
);

-- 3.	Find out the total price paid by the individual customer.
SELECT cust_id, SUM(price) AS total_price FROM invoice
JOIN movie ON invoice.mv_no = movie.mv_no
GROUP BY cust_id;

-- 4.	Find out the name(fname,lname) of the customer who have issued more than one movie.
SELECT fname, Iname FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    GROUP BY cust_id
    HAVING COUNT(mv_no) > 1
);

-- 5.	Using aggregate function find out the fname of the customer who have issued more than one movie.
SELECT fname FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    GROUP BY cust_id
    HAVING COUNT(mv_no) > 1
);

-- 6.	Find out the name(fname,lname) of lowest price of comedy movie.
SELECT fname, Iname FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    WHERE mv_no = (
        SELECT mv_no FROM movie
        WHERE type = 'comedy'
        ORDER BY price ASC
        LIMIT 1
    )
);

-- 7.	Find out name(fname,lname) & cust_id of the customer who have seen the movie 'gone with the wind' or 'home alone' or both.
SELECT fname, Iname, cust_id FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    WHERE mv_no IN (
        SELECT mv_no FROM movie
        WHERE title IN ('gone with the wind', 'home alone')
    )
);

-- 8.	Find out name(fname,lname) & cust_id of the customer who have seen both movie 'gone with the wind' and 'home alone'.
SELECT fname, Iname, cust_id FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    WHERE mv_no IN (
        SELECT mv_no FROM movie WHERE title = 'gone with the wind'
    )
) AND cust_id IN (
    SELECT cust_id FROM invoice
    WHERE mv_no IN (
        SELECT mv_no FROM movie WHERE title = 'home alone'
    )
);

-- 9.	Find out name(fname,lname) & cust_id of the customer who have seen the movie 'gone with the wind' but not 'home alone'.
SELECT fname, Iname, cust_id FROM cust
WHERE cust_id IN (
    SELECT cust_id FROM invoice
    WHERE mv_no IN (
        SELECT mv_no FROM movie WHERE title = 'gone with the wind'
    )
) AND cust_id NOT IN (
    SELECT cust_id FROM invoice
    WHERE mv_no IN (
        SELECT mv_no FROM movie WHERE title = 'home alone'
    )
);

-- 10.	Create a view comedymovies with title of movie table for only comedy movies from movie table.
CREATE VIEW comedymovies AS
SELECT title FROM movie
WHERE type = 'comedy';

-- 11.	Find out the names of comedymovies using the above view.
SELECT title FROM comedymovies;

-- 12.	Create a view comedymovieprice with title,price of movie table for only comedy movies.
CREATE VIEW comedymovieprice AS
SELECT title, price FROM movie
WHERE type = 'comedy';

-- 13.	Find out the price of comedy movie home alone from the above view.
SELECT price FROM comedymovieprice
WHERE title = 'home alone';

-- 14.	Create a view movietypewisetotalprice with two attributes named as movietype and totalprice from movie table for each movie.
CREATE VIEW movietypewisetotalprice AS
SELECT type AS movietype, SUM(price) AS totalprice FROM movie
GROUP BY type;

-- 15.	Find the total price for each movie type by using the above view.
SELECT movietype, totalprice FROM movietypewisetotalprice;

