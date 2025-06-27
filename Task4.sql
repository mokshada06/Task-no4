CREATE DATABASE Task4;
USE Task4;

CREATE TABLE Sales(
 ID INT,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2));

INSERT INTO Sales VALUES 
(1, 'Laptop', 'Electronics', 5, 50000),
(2, 'Mobile', 'Electronics', 10, 20000),
(3, 'Keyboard', 'Electronics', 15, 1500),
(4, 'Chair', 'Furniture', 7, 3000),
(5, 'Table', 'Furniture', 3, 7000),
(6, 'Pen', 'Stationery', 50, 10),
(7, 'Notebook', 'Stationery', 30, 50),
(8, 'Mouse', 'Electronics', 12, 1200),
(9, 'Monitor', 'Electronics', 4, 12000),
(10, 'Cupboard', 'Furniture', 2, 10000),
(11, 'Desk Lamp', 'Furniture', 6, 1200),
(12, 'Calculator', 'Stationery', 9, 600),
(13, 'Stapler', 'Stationery', 11, 150),
(14, 'Tablet', 'Electronics', 3, 25000),
(15, 'Water Bottle', 'Stationery', 20, 200);


## USING COUNT COMMAND
SELECT COUNT(*) AS Total_Records FROM Sales;

SELECT COUNT(*) FROM Sales WHERE Product = 'Laptop';

SELECT *, 
    (SELECT COUNT(*) FROM Sales WHERE Category = 'Stationery') AS Stationery_Count
FROM Sales
WHERE Category = 'Stationery';

SELECT COUNT(*) AS Tablet_Count FROM Sales WHERE product = 'Tablet';


## USING SUM COMMAND
SELECT SUM(Quantity) AS Total_Quantity FROM Sales;

SELECT SUM(Price) AS Total_Price FROM Sales;

SELECT *,
	(SELECT SUM(Quantity) FROM Sales WHERE Category = 'Furniture') AS Furniture_Quantity
    FROM Sales;
    

## USING AVG COMMAND
SELECT AVG(Price) AS Average_Price FROM Sales;

SELECT AVG(Price) AS Average_Price FROM Sales WHERE Category = 'Electronics';

SELECT Category, ROUND(AVG(Price), 2) AS Rounded_Avg_Price
FROM Sales
GROUP BY Category;


## USING MAX COMMAND
SELECT MAX(Price) AS Max_Price FROM Sales;

SELECT *,
	(SELECT MAX(Price) AS Max_Price FROM Sales)
    FROM Sales;


## USING MIN COMMAND
SELECT MIN(Quantity) AS Min_Quantity FROM Sales;

SELECT *,
	(SELECT MIN(Quantity) AS Min_Quantity FROM Sales) AS Min_Quantity 
    FROM Sales;
    
    
## USING GROUP BY 
SELECT Category,
       VAR_SAMP(Price) AS Price_Variance,
       STDDEV_SAMP(Quantity) AS Quantity_StdDev
FROM Sales
GROUP BY Category;

SELECT Category, SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Category;

SELECT Quantity FROM Sales GROUP BY Quantity;


## USING HAVING 
SELECT Category
FROM Sales
GROUP BY Category
HAVING SUM(Quantity) > 50;

SELECT Category, AVG(Price) AS Avg_Price
FROM Sales
GROUP BY Category
HAVING AVG(Price) > 5000;

SELECT Category, Product, SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Category, Product
HAVING Total_Quantity > 10;

