CREATE DATABASE ProductTask
USE ProductTask

CREATE TABLE Products(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL,
    [Price] DECIMAL(18,2),
    [Cost]  DECIMAL(18,2),
    [CatId] INT REFERENCES Categories(Id)
)

CREATE TABLE Categories(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Colors(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE ProductColor(
    [ProductID] INT REFERENCES Products(Id),
    [ColorID] INT REFERENCES Colors(Id)
)

INSERT INTO Categories (Name) VALUES 
('Tv'),
('Phone'),
('Camera'),
('Computer')

INSERT INTO Colors (Name) VALUES
('Red'),
('Blue'),
('Black'),
('White')

INSERT INTO Products (Name,Price,Cost,CatId) VALUES 
('Samsung Tv1500', 799.90, 400.20, 1),
('Iphone 15', 3200, 2500, 2),
('Nikon D850', 6299.99, 4300.50, 3),
('Asus TUF Gaming F15', 2399.99, 2000, 4)

INSERT INTO ProductColor ([ProductID], [ColorID]) VALUES 
(1,2),
(1,3),
(2,1),
(3,3),
(4,4),
(4,3)


SELECT P.Name AS 'Product Name',
C.Name AS 'Category Name',
Cl.Name AS 'Color Name'
--P.Price AS 'Price' optional
FROM Products P
JOIN Categories C ON P.CatId=C.Id
JOIN ProductColor PC ON P.Id=PC.ProductId
JOIN Colors CL ON PC.ColorID=CL.Id