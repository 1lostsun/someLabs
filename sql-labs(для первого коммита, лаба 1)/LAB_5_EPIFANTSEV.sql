USE AdventureWorksLT2019

-- 1.1/1.2/1.3/1.4
SELECT 
    ProductID, 
    UPPER(Name)AS ProductName,
    ROUND(Weight, 0) AS ApproxWeight,
    DateName(MONTH, SellStartDate ) AS SellStartMonth,
    DateName(YEAR, SellStartDate) AS SellStartYear,
    LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product 
WHERE ISNUMERIC(Size) = 1;

-- 2.1
SELECT 
    CompanyName,
    TotalDue AS Revenue,
    RANK() OVER(ORDER BY TotalDue DESC) AS RankByRevenue
FROM SalesLT.SalesOrderHeader
JOIN SalesLT.Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID;

-- 3.1
SELECT 
    Product.Name,
    SUM(SalesOrderDetail.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
JOIN SalesLT.Product AS Product 
ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY Product.Name
ORDER BY TotalRevenue DESC;

-- 3.2
SELECT 
    Product.Name,
    SUM(SalesOrderDetail.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
INNER JOIN SalesLT.Product AS Product 
ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY Product.Name
HAVING SUM(SalesOrderDetail.UnitPrice) > 1000
ORDER BY TotalRevenue DESC;

-- 3.3
SELECT 
    Product.Name,
    SUM(SalesOrderDetail.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SalesOrderDetail
JOIN SalesLT.Product AS Product 
ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY Product.Name
HAVING SUM(SalesOrderDetail.LineTotal) > 20000
ORDER BY TotalRevenue DESC;
