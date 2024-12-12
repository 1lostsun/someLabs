USE AdventureWorksLT2019

-- 1.1
SELECT 
    a.CountryRegion, 
    a.StateProvince, 
    SUM(soh.TotalDue) AS Revenue
FROM 
    SalesLT.Address AS a
INNER JOIN 
    SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
INNER JOIN 
    SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
INNER JOIN 
    SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY 
    a.CountryRegion, a.StateProvince;

-- 1.2

SELECT 
    a.CountryRegion, 
    a.StateProvince, 
    SUM(soh.TotalDue) AS Revenue,
    CASE 
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 3 THEN 'Total'
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince) = 1 THEN a.CountryRegion + ' Subtotal'
        ELSE a.StateProvince + ' Subtotal'
    END AS Level
FROM 
    SalesLT.Address AS a
INNER JOIN 
    SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
INNER JOIN 
    SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
INNER JOIN 
    SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY 
    a.CountryRegion, a.StateProvince;

-- 1.3

SELECT 
    a.CountryRegion, 
    a.StateProvince, 
    a.City,
    SUM(soh.TotalDue) AS Revenue,
    CASE 
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 7 THEN 'Total'
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 3 THEN a.CountryRegion + ' Subtotal'
        WHEN GROUPING_ID(a.CountryRegion, a.StateProvince, a.City) = 5 THEN a.StateProvince + ' Subtotal'
        ELSE a.City + ' Subtotal'
    END AS Level
FROM 
    SalesLT.Address AS a
INNER JOIN 
    SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
INNER JOIN 
    SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
INNER JOIN 
    SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY 
    a.CountryRegion, a.StateProvince, a.City;

-- 2.1

WITH temp AS 
    (
        SELECT c.CompanyName,v.ParentProductCategoryName,sod.LineTotal
FROM 
    SalesLT.Customer AS c 
JOIN SalesLT.SalesOrderHeader soh 
ON(c.CustomerID = soh.CustomerID) 
JOIN SalesLT.SalesOrderDetail as sod
ON(sod.SalesOrderID = soh.SalesOrderID) 
JOIN SalesLT.Product as p 
ON(p.ProductID = sod.ProductID) 
JOIN SalesLT.vGetAllCategories as v 
ON(v.ProductCategoryID = p.ProductCategoryID)
    )
SELECT * FROM temp
PIVOT(sum(LineTotal) 
    FOR ParentProductCategoryName IN ([Accessories],[Bikes], [CLothing],[Components])) 
AS SalesPivoted
ORDER BY CompanyName