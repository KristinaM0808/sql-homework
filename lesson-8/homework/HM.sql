--Easy-Level Tasks
Task - 1 Using Products table, find the total number of products available in each category.
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

Task - 2 Using Products table, get the average price of products in the 'Electronics' category.
SELECT AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics';

Task - 3 Using Customers table, list all customers from cities that start with 'L'.
SELECT *
FROM Customers
WHERE City LIKE 'L%';

Task - 4 Using Products table, get all product names that end with 'er'.
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';

Task - 5 Using Customers table, list all customers from countries ending in 'A'.
SELECT *
FROM Customers
WHERE Country LIKE '%a';

Task - 6 Using Products table, show the highest price among all products.
SELECT MAX(Price) AS HighestPrice
FROM Products;

Task - 7 Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
SELECT 
  ProductName,
  Quantity,
  CASE
    WHEN Quantity < 30 THEN 'Low Stock'
    ELSE 'Sufficient'
  END AS StockStatus
FROM Products;

Task - 8 Using Customers table, find the total number of customers in each country.
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

Task - 9 Using Orders table, find the minimum and maximum quantity ordered.
SELECT 
  MIN(Quantity) AS MinQuantity,
  MAX(Quantity) AS MaxQuantity
FROM Orders;

--Medium-Level Tasks

Task - 10 Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE 
  o.OrderDate >= '2023-01-01' AND o.OrderDate < '2023-02-01'
  AND o.CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Invoices
  );

Task - 11 Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
SELECT ProductName
FROM Products

UNION ALL

SELECT ProductName
FROM Products_Discounted;

Task - 12 Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
  SELECT ProductName
FROM Products

UNION

SELECT ProductName
FROM Products_Discounted;

Task - 13 Using Orders table, find the average order amount by year.
  SELECT 
  EXTRACT(YEAR FROM OrderDate) AS OrderYear,
  AVG(OrderAmount) AS AverageOrderAmount
FROM Orders
GROUP BY EXTRACT(YEAR FROM OrderDate)
ORDER BY OrderYear;

Task - 14 Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
  SELECT 
  ProductName,
  CASE
    WHEN Price < 100 THEN 'Low'
    WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
    WHEN Price > 500 THEN 'High'
  END AS PriceGroup
FROM Products;

Task - 15 Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
  INSERT INTO Population_Each_Year (City, [2012], [2013])
SELECT City, [2012], [2013]
FROM
(
    SELECT City, Year, Population
    FROM City_Population
) AS SourceTable
PIVOT
(
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;

Task - 16 Using Sales table, find total sales per product Id.
  SELECT ProductId, 
       SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY ProductId;

Task - 17 Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
  SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

Task - 18 Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
  SELECT Year, [Bektemir], [Chilonzor], [Yakkasaroy]
INTO Population_Each_City
FROM
(
    SELECT Year, City, Population
    FROM City_Population
) AS SourceTable
PIVOT
(
    SUM(Population)
    FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS PivotTable;

--Hard-Level Tasks
Task - 19 Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
  SELECT TOP 3 CustomerID, SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

Task - 20 Transform Population_Each_Year table to its original format (City_Population).
  SELECT
    City,
    Year,
    Population
FROM
    Population_Each_Year
UNPIVOT
(
    Population FOR Year IN ([2012], [2013])
) AS unpvt;

Task - 21 Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
  SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS NumberOfTimesSold
FROM 
    Products p
LEFT JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName
ORDER BY
    NumberOfTimesSold DESC;

Task - 22 Transform Population_Each_City table to its original format (City_Population).

SELECT
    district_id,
    district_name,
    population,
    year
FROM Population_Each_City
UNPIVOT (
    population FOR district_name IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS unpvt
ORDER BY year, district_name;
