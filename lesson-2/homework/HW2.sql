--Basic-Level Tasks
--1 task
create table Employees (EmpID int, Name varchar(50),salary decimal(10,2))
--2 task.
Variant1
insert into Employees values
(1,'Asi',635)
Variant2
insert into Employees values
(1,'Asi',635),
(2,'Kris',632)
--3 task.
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1
--4 task.
DELETE FROM Employees
WHERE EmpID = 2
--5 task.
Delete - удаляет одну или несколько строк из таблицы, структура таблицы сохраняется 
Truncate - удаляет все строки из таблицы, структура таблицы и ее индексы остаются
drop - удаляет саму таблицу ил базу полностью. Таблица полностью исчезает из базы данных вместе с данными и структурой
--6 task.
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100)
--7 task.
ALTER TABLE Employees
ADD Department VARCHAR(50)
--8 task.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT
--9 task.
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
--10 task.
TRUNCATE TABLE Employees;
--Intermediate-Level Tasks 
--11 task.
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT *
FROM (VALUES
    (1, 'HR'),
    (2, 'Management'),
    (3, 'IT'),
    (4, 'Marketing'),
    (5, 'Sales')
) AS Dept(DepartmentID, DepartmentName);
--12 task.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
--13 task.
TRUNCATE TABLE Employees
--14 task.
ALTER TABLE Employees
DROP COLUMN Department;
--15 task.
EXEC sp_rename 'Employees', 'StaffMembers'
--16 task.
DROP TABLE Departments
--Advanced-Level Tasks 
--17 task.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
--18 task.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0)
--19 task.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50
--20 task.
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN'
--21 task.
INSERT INTO Products VALUES (1, 'Компьютер', 'Electronics', 1500.00, 15);
INSERT INTO Products VALUES (2, 'стол', 'Furniture', 100.50, 20);
INSERT INTO Products VALUES (3, 'ручки', 'Office Supplies', 7.99, 500);
INSERT INTO Products VALUES (4, 'Планшет', 'Electronics', 699.99, 20);
INSERT INTO Products VALUES (5, 'тарелки', 'Kitchen Appliances', 75.00, 80)
--22 task.
SELECT *
INTO Products_Backup
FROM Products
--23 task.
EXEC sp_rename 'Products', 'Inventory'
--24 task.
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT
--25 task.
ALTER TABLE Inventory
ADD ProductCode INT
