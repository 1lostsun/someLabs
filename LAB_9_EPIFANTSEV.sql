USE AdventureWorksLT2019

--1.1

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

SELECT SCOPE_IDENTITY() AS ProductID;

SELECT * FROM SalesLT.Product 
WHERE ProductNumber = 'LT-L123';

--1.2
INSERT INTO SalesLT.ProductCategory (ParentProductCategoryID, Name)
VALUES (4, 'Bells and Horns');

DECLARE @NewCategoryID INT;
SET @NewCategoryID = SCOPE_IDENTITY();

INSERT INTO SalesLT.Product (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES 
    ('Bicycle Bell', 'BB-RING', 2.47, 4.99, @NewCategoryID, GETDATE()),
    ('Bicycle Horn', 'BB-PARP', 1.29, 3.75, @NewCategoryID, GETDATE());

SELECT p.*, pc.Name AS CategoryName
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bells and Horns';


-- 2.1
UPDATE SalesLT.Product
SET ListPrice = ListPrice * 1.10
FROM SalesLT.Product AS p
INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bells and Horns';

-- 2.2
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37
AND ProductNumber != 'LT-L123';

-- 3.1
DELETE FROM SalesLT.Product
WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

DELETE FROM SalesLT.ProductCategory
WHERE Name = 'Bells and Horns';