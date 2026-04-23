CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE orders (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID INT,
    Country VARCHAR(50),
    TotalAmount FLOAT,
    Year INT,
    Month INT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
TRUNCATE TABLE orders;
SELECT COUNT(*) FROM orders;



SELECT CustomerID,
       SUM(TotalAmount) AS total_spent
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;


SELECT Year, Month,
       SUM(TotalAmount) AS revenue
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;


SELECT Description,
       SUM(TotalAmount) AS revenue
FROM orders
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


SELECT Country,
       SUM(TotalAmount) AS revenue
FROM orders
GROUP BY Country
ORDER BY revenue DESC;


SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS total_orders
FROM orders
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Prabhas@12';
FLUSH PRIVILEGES;