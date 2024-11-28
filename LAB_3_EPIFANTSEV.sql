USE AdventureWorksLT2019


-- 1.1

SELECT 
    Customer.CompanyName, 
    OrderHeader.SalesOrderID, 
    OrderHeader.TotalDue,
    Customer.CustomerID
FROM SalesLT.Customer AS Customer
JOIN SalesLT.SalesOrderHeader AS OrderHeader 
ON Customer.CustomerID = OrderHeader.CustomerID;


-- 1.2

SELECT 
    Customer.CompanyName, 
    OrderHeader.SalesOrderID, 
    OrderHeader.TotalDue,
    Customer.CustomerID,
    CONCAT(Address.AddressLine1, ' ', ISNULL(Address.AddressLine2, '')) AS FullAdress,
    Address.City, 
    Address.StateProvince,
    Address.PostalCode,
    Address.CountryRegion
FROM SalesLT.Customer AS Customer
JOIN SalesLT.SalesOrderHeader AS OrderHeader 
ON Customer.CustomerID = OrderHeader.CustomerID
JOIN SalesLT.CustomerAddress AS CustomerAddress
ON Customer.CustomerID = CustomerAddress.CustomerID AND CustomerAddress.AddressType = 'Main Office'
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID;

-- 2.1

SELECT 
    Customer.CompanyName, 
    CONCAT(Customer.FirstName, ' ', Customer.LastName) AS FullName,
    OrderHeader.SalesOrderID,
    OrderHeader.TotalDue
FROM SalesLT.Customer AS Customer
LEFT JOIN SalesLT.SalesOrderHeader AS OrderHeader
ON Customer.CustomerID = OrderHeader.CustomerID
ORDER BY OrderHeader.SalesOrderID DESC

-- 2.2
SELECT
    Customer.CustomerID,
    Customer.CompanyName,
    CONCAT(Customer.FirstName, ' ', Customer.LastName) AS FullName,
    Customer.Phone
FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress
ON Customer.CustomerID = CustomerAddress.CustomerID

2.3
SELECT 
    Customer.CustomerID,
    Product.ProductID
FROM SalesLT.Customer AS Customer
FULL OUTER JOIN SalesLT.SalesOrderHeader AS OrderHeader
ON Customer.CustomerID = OrderHeader.CustomerID
FULL OUTER JOIN SalesLT.SalesOrderDetail AS OrderDetail
ON OrderHeader.SalesOrderID = OrderDetail.SalesOrderID
FULL OUTER JOIN SalesLT.Product AS Product
ON OrderDetail.ProductID = Product.ProductID
WHERE OrderHeader.SalesOrderID IS NULL OR OrderDetail.SalesOrderID IS NULL


