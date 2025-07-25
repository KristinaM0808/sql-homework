--Easy-Level Tasks
1-task
BULK INSERT — это команда T-SQL в Microsoft SQL Server, которая используется для быстрого массового импорта данных из текстового файла (например, CSV, TXT) в таблицу базы данных.
2-task
- CSV (Comma-Separated Values / значения, разделённые запятыми)
- TXT (Текстовые файлы)
- XLS/XLSX (Файлы Microsoft Excel)
-XML (eXtensible Markup Language)
3-task
  create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))
4-task 
  INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Ноут', 456.99),
(2, 'Телефон', 250.50),
(3, 'Наушники', 49.75)
5-task
  null- Обозначает отсутствие значения в ячейке таблицы.
  not null - Указывает, что значение обязательно должно быть задано.
6-task
  ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName)
7-task
  обозначение комментариев двойной дефис "--"
-- Этот запрос выбирает все продукты с ценой выше 500
SELECT * 
FROM Products
WHERE Price > 500;
8-task
  ALTER TABLE Products
ADD CategoryID INT;
9-task
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
10-task
Столбец с атрибутом IDENTITY используется для автоматической генерации уникальных числовых значений при добавлении новых строк в таблицу.
Обычно применяется в первичных ключах (например, ID), чтобы автоматически нумеровать записи без необходимости вручную указывать значение.
Medium-Level Tasks
11-task
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',    -- разделитель полей (например, запятая)
    ROWTERMINATOR = '\n',     -- разделитель строк
    FIRSTROW = 2              -- пропустить заголовок (если есть)
);
12-task
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
13-task
PRIMARY KEY - Это основной идентификатор строки в таблице. Значение должно быть уникальным — нельзя, чтобы два ряда имели одинаковый первичный ключ. 
Не может содержать NULL — то есть это поле всегда должно иметь значение.
В таблице может быть только один PRIMARY KEY.
UNIQUE KEY - Обеспечивает, чтобы значения в столбце (или группе столбцов) не повторялись.
Может содержать NULL — но только один раз (в большинстве СУБД).
В таблице может быть несколько уникальных ключей.
Используется для дополнительных ограничений уникальности, не как основной идентификатор.
14-task
ALTER TABLE Products
ADD CONSTRAINT CHK_Products_Price
CHECK (Price > 0);
15-task
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
16-task
SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price,
    CategoryID,
    Stock
FROM Products;
17-task
FOREIGN KEY (внешний ключ) — это ограничение, которое устанавливает связь между двумя таблицами в базе данных.
Он указывает, что значение в одном столбце (или группе столбцов) должно соответствовать значению в первичном ключе другой таблицы.
Hard-Level Tasks
18-task
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    CONSTRAINT CHK_Customers_Age CHECK (Age >= 18)
);
19-task
CREATE TABLE Bank (
    ID INT IDENTITY(100, 10) PRIMARY KEY,
    name VARCHAR(50)
);
20-task
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);
21-task
 COALESCE - Возвращает первое не-NULL значение из списка аргументов.
  ISNULL - Заменяет NULL в выражении на заданное значение replacement
22-task
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Position VARCHAR(50)
);
23-task
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;
