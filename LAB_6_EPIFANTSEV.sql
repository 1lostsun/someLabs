USE AdventureWorksLT2019

--1.1
SELECT 
    ProductID, Name, Listprice
FROM SalesLT.Product
WHERE ListPrice >
(
    SELECT avg(UnitPrice) 
    FROM SalesLT.SalesOrderDetail
)

--1.2
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductID IN (
    SELECT ProductID 
    FROM SalesLT.SalesOrderDetail
    WHERE UnitPrice < 100.00
) AND ListPrice >= 100.00

--1.3
SELECT 
    ProductID, 
    Name,
    StandardCost
    ListPrice,
    (SELECT AVG(UnitPrice) 
    FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
    WHERE Product.ProductID = SalesOrderDetail.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS Product

--1.4
SELECT 
    ProductID, 
    Name,
    StandardCost
    ListPrice,
    (SELECT AVG(UnitPrice) 
    FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
    WHERE Product.ProductID = SalesOrderDetail.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS Product
WHERE StandardCost > (
    SELECT AVG(UnitPrice) 
    FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
    WHERE Product.ProductID = SalesOrderDetail.ProductID
);

--2.1
SELECT 
    SalesOrderHeader.SalesOrderID,
    SalesOrderHeader.CustomerID, 
    ClientInformation.FirstName, 
    ClientInformation.LastName, 
    SalesOrderHeader.Totaldue
FROM SalesLT.SalesOrderHeader AS SalesOrderHeader
CROSS APPLY 
    dbo.ufnGetCustomerInformation(soh.CustomerID) AS ClientInformation
ORDER BY SalesOrderID;

SELECT 
    CustomerAddress.CustomerID, 
    CustomerInformation.FirstName,
    CustomerInformation.LastName,
    Address.AddressLine1,
    Address.City
 FROM SalesLT.Address AS Address
JOIN SalesLT.CustomerAddress AS CustomerAddress
ON Address.AddressID = CustomerAddress.AddressID
CROSS APPLY 
dbo.ufnGetCustomerInformation(CustomerAddress.CustomerID) AS CustomerInformation
ORDER BY CustomerAddress.CustomerID;

