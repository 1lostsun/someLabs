USE AdventureWorksLT2019;

-- 1.1

CREATE FUNCTION dbo.fn_GetOrdersTotalDueForCustomer (@CustomerID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalDue MONEY;

    SELECT @TotalDue = SUM(TotalDue)
    FROM SalesLT.SalesOrderHeader
    WHERE CustomerID = @CustomerID;

    RETURN @TotalDue;
END;
GO

SELECT dbo.fn_GetOrdersTotalDueForCustomer(1) AS TotalDueForCustomer1;
SELECT dbo.fn_GetOrdersTotalDueForCustomer(30113) AS TotalDueForCustomer30113;

-- 1.2

CREATE VIEW dbo.vAllAddresses
AS
SELECT 
    ca.CustomerID,
    a.AddressID,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.StateProvince,
    a.CountryRegion,
    a.PostalCode,
    cat.Name AS AddressType
FROM 
    SalesLT.CustomerAddress ca
JOIN 
    SalesLT.Address a ON ca.AddressID = a.AddressID
JOIN 
    SalesLT.AddressType cat ON ca.AddressTypeID = cat.AddressTypeID;
GO

SELECT * FROM dbo.vAllAddresses;

-- 1.3

CREATE FUNCTION dbo.fn_GetAddressesForCustomer (@CustomerID INT)
RETURNS TABLE
AS
RETURN
    SELECT *
    FROM dbo.vAllAddresses
    WHERE CustomerID = @CustomerID;
GO

SELECT * FROM dbo.fn_GetAddressesForCustomer(0);
SELECT * FROM dbo.fn_GetAddressesForCustomer(29502);
SELECT * FROM dbo.fn_GetAddressesForCustomer(29503);

-- 1.4

CREATE FUNCTION dbo.fn_GetMinMaxOrderPricesForProduct (@ProductID INT)
RETURNS TABLE
AS
RETURN
    SELECT 
        MIN(UnitPrice) AS MinUnitPrice,
        MAX(UnitPrice) AS MaxUnitPrice
    FROM 
        SalesLT.SalesOrderDetail
    WHERE 
        ProductID = @ProductID;
GO

SELECT * FROM dbo.fn_GetMinMaxOrderPricesForProduct(0);
SELECT * FROM dbo.fn_GetMinMaxOrderPricesForProduct(711);

-- 1.5

CREATE FUNCTION dbo.fn_GetAllDescriptionsForProduct (@ProductID INT)
RETURNS TABLE
AS
RETURN
    SELECT 
        p.ProductID,
        p.Name,
        pm.Name AS ProductModel,
        pmd.Culture,
        pd.Description,
        dbo.fn_GetMinMaxOrderPricesForProduct(@ProductID).MinUnitPrice,
        dbo.fn_GetMinMaxOrderPricesForProduct(@ProductID).MaxUnitPrice,
        p.ListPrice
    FROM 
        SalesLT.Product p
    JOIN 
        SalesLT.ProductModel pm ON p.ProductModelID = pm.ProductModelID
    JOIN 
        SalesLT.ProductModelProductDescription pmd ON pm.ProductModelID = pmd.ProductModelID
    JOIN 
        SalesLT.ProductDescription pd ON pmd.ProductDescriptionID = pd.ProductDescriptionID
    WHERE 
        p.ProductID = @ProductID;
GO

SELECT * FROM dbo.fn_GetAllDescriptionsForProduct(0);
SELECT * FROM dbo.fn_GetAllDescriptionsForProduct(711);

-- 2.1

ALTER VIEW dbo.vAllAddresses WITH SCHEMABINDING
AS
SELECT 
    ca.CustomerID,
    a.AddressID,
    a.AddressLine1,
    a.AddressLine2,
    a.City,
    a.StateProvince,
    a.CountryRegion,
    a.PostalCode,
    cat.Name AS AddressType
FROM 
    SalesLT.CustomerAddress ca
JOIN 
    SalesLT.Address a ON ca.AddressID = a.AddressID
JOIN 
    SalesLT.AddressType cat ON ca.AddressTypeID = cat.AddressTypeID;
GO

CREATE UNIQUE CLUSTERED INDEX UIX_vAllAddresses
ON dbo.vAllAddresses (CustomerID, AddressID);
GO

SELECT * FROM dbo.vAllAddresses WITH (NOEXPAND);