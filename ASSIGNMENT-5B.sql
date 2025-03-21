--! 11. Calculate the average price of all movies where type is 'comedy' or 'thriller' and price is greater than or equal to 150.00.
SELECT AVG(price) AS average_price FROM movie WHERE (type = 'comedy' OR type = 'thriller') AND price >= 150;

--! 12. Display the invoice number and day on which customers were issued movies.
SELECT inv_no, issue_date FROM invoice;

--! 13. Display the month (in alphabets) in which customers are supposed to return the movies.
SELECT DATE_FORMAT(return_date, '%M') FROM invoice;

--! 14. Display the issue-date in the format 'dd-month-yy' - For eg. 12-february-93.
SELECT DATE_FORMAT(issue_date, '%d-%M-%y') FROM invoice;

--! 15. Find current date.
SELECT CURRENT_DATE;

--! 16. Find current date and time.
SELECT CURRENT_TIMESTAMP;

--! 17. Find the date, 15 days after the current date.
SELECT CURRENT_DATE + INTERVAL 15 DAY;

--! 18. Find the number of days elapsed between the current date and the return date of the movie for all customers.
SELECT DATEDIFF(return_date, CURRENT_DATE) FROM invoice;