USE AdventureWorksLT2019

1.1
SELECT * from SalesLT.Customer;

1.2
SELECT FirstName FROM SalesLT.Customer;

1.3
SELECT SalesPerson, CONCAT(Title, ' ', FirstName) AS CustomerName, Phone FROM SalesLT.Customer;

2.1
SELECT CONCAT(CustomerID, ':', CompanyName) FROM SalesLT.Customer;

2.2
SELECT CONCAT(SalesOrderID, '(', RevisionNumber, ')') AS OrderRevision, CONVERT(varchar, OrderDate, 102) AS OrderDate FROM SalesLT.SalesOrderHeader;

3.1 
SELECT CONCAT(FirstName, ' ', LastName, ISNULL(MiddleName, '')) AS CustomerName FROM SalesLT.Customer;

3.2 
SELECT CustomerID, ISNULL(EmailAddress, Phone) from SalesLT.Customer;

3.3
UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate,
    CASE 
        WHEN ShipDate IS NOT NULL THEN 'Shipped'
        ELSE 'Awaiting Shipment' 
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader
