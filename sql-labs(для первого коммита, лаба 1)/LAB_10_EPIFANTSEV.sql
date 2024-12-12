USE AdventureWorksLT2019;

-- 1.1 

DECLARE @OrderDate DATE = GETDATE();
DECLARE @DueDate DATE = DATEADD(DAY, 7, GETDATE());
DECLARE @CustomerID INT = 1;
DECLARE @SalesOrderID INT;

SELECT @SalesOrderID = NEXT VALUE FOR SalesLT.SalesOrderNumber;
SET IDENTITY_INSERT SalesLT.SalesOrderHeader ON;

INSERT INTO SalesLT.SalesOrderHeader (SalesOrderID, OrderDate, DueDate, CustomerID, ShipMethod)
VALUES (@SalesOrderID, @OrderDate, @DueDate, @CustomerID, 'CARGO TRANSPORT 5');

PRINT 'SalesOrderID: ' + CAST(@SalesOrderID AS NVARCHAR);

-- 1.2

DECLARE @ProductID INT = 760;
DECLARE @Quantity INT = 1;
DECLARE @UnitPrice MONEY = 782.99;


IF EXISTS (SELECT 1 FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
BEGIN
    INSERT INTO SalesLT.SalesOrderDetail (SalesOrderID, ProductID, OrderQty, UnitPrice)
    VALUES (@SalesOrderID, @ProductID, @Quantity, @UnitPrice);
END
ELSE
BEGIN
    PRINT N'Заказ не существует';
END

-- 2.1

DECLARE @AveragePrice MONEY;
DECLARE @MaxPrice MONEY;
DECLARE @MarketAveragePrice MONEY = 2000;
DECLARE @MaxAcceptablePrice MONEY = 5000;

SELECT @AveragePrice = AVG(p.ListPrice), @MaxPrice = MAX(p.ListPrice)
FROM SalesLT.Product p
JOIN SalesLT.vGetAllCategories c ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.ParentProductCategoryName = 'Bikes';

WHILE @AveragePrice < @MarketAveragePrice AND @MaxPrice < @MaxAcceptablePrice
BEGIN
    UPDATE SalesLT.Product
    SET ListPrice = ListPrice * 1.1
    FROM SalesLT.Product p
    JOIN SalesLT.vGetAllCategories c ON p.ProductCategoryID = c.ProductCategoryID
    WHERE c.ParentProductCategoryName = 'Bikes';

    SELECT @AveragePrice = AVG(p.ListPrice), @MaxPrice = MAX(p.ListPrice)
    FROM SalesLT.Product p
    JOIN SalesLT.vGetAllCategories c ON p.ProductCategoryID = c.ProductCategoryID
    WHERE c.ParentProductCategoryName = 'Bikes';
END

PRINT N'Новая средняя цена на велосипед: ' + CAST(@AveragePrice AS NVARCHAR);
PRINT N'Новая максимальная цена велосипеда: ' + CAST(@MaxPrice AS NVARCHAR);