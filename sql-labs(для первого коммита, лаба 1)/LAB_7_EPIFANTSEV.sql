USE AdventureWorksLT2019

-- 1.1
SELECT
    ProductID,
    Product.Name AS ProductName,
    ProductModel.Name AS ProductModelName
FROM SalesLT.Product AS Product
JOIN SalesLT.vProductModelCatalogDescription AS ProductModel
ON Product.ProductModelID = ProductModel.ProductModelID
ORDER BY ProductID

--1.2
DECLARE @Colors AS TABLE (Color NVARCHAR(15));

INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;

SELECT
    ProductID,
    Name AS ProductName,
    Color
FROM SalesLT.Product
WHERE Color IN (
    SELECT Color FROM @Colors
);

--1.3
CREATE TABLE #Sizes (Sizes NVARCHAR(100))

INSERT INTO #Sizes(Sizes)
SELECT
    DISTINCT Size
FROM SalesLT.Product
WHERE Size IS NOT NULL
SELECT
    ProductID,
    Name AS ProductName,
    Size
FROM SalesLT.Product
WHERE Size IN (
    SELECT Sizes FROM #Sizes
);

--1.4
SELECT
    ProductID,
    NAME ProductName,
    ParentProductCategoryName ParentCategory,
    ProductCategoryName Category
FROM SalesLT.Product AS Product
JOIN DBO.ufnGetAllCategories() GetAllCategories
ON Product.ProductCategoryID = GetAllCategories.ProductCategoryID
ORDER BY ParentCategory

--2.1
SELECT
    CompanyContact,
    SUM(TotalDue) Revenue
FROM (
    SELECT
        Customer.CustomerID,
        CONCAT(Customer.CompanyName, ' ', Customer.FirstName, ' ', Customer.LastName) CompanyContact,
        SalesOrderHeader.TotalDue
    FROM SalesLT.Customer Customer
    JOIN SalesLT.SalesOrderHeader SalesOrderHeader
    ON Customer.CustomerID = SalesOrderHeader.CustomerID
) AS D
GROUP BY CompanyContact

--2.2
WITH CustomerSales AS (
    SELECT
        Customer.CustomerID,
        CONCAT(Customer.CompanyName, ' ', Customer.FirstName, ' ', Customer.LastName) CompanyContact,
        SalesOrderHeader.TotalDue
    FROM SalesLT.Customer Customer
    JOIN SalesLT.SalesOrderHeader SalesOrderHeader
    ON Customer.CustomerID = SalesOrderHeader.CustomerID
)
SELECT 
    CompanyContact,
    SUM(TotalDue) Revenue FROM CustomerSales
GROUP BY CompanyContact;