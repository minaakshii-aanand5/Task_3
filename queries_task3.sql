
-- Task 3: SQL Basics – Chinook Database

-- 1. View sample data
SELECT * FROM Customer LIMIT 10;

-- 2. Filtering using WHERE
SELECT * FROM Customer
WHERE Country = 'USA';

-- 3. Sorting using ORDER BY
SELECT * FROM Invoice
ORDER BY Total DESC
LIMIT 10;

-- 4. Aggregation using GROUP BY
SELECT Country, SUM(Total) AS total_sales
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY Country;

-- 5. HAVING clause
SELECT Country, SUM(Total) AS total_sales
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY Country
HAVING SUM(Total) > 100;

-- 6. BETWEEN (date range)
SELECT * FROM Invoice
WHERE InvoiceDate BETWEEN '2013-01-01' AND '2013-12-31';

-- 7. LIKE (pattern search)
SELECT * FROM Customer
WHERE FirstName LIKE '%a%';

-- 8. Top 5 customers by total spend
SELECT c.FirstName || ' ' || c.LastName AS customer_name,
       SUM(i.Total) AS total_spend
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spend DESC
LIMIT 5;
