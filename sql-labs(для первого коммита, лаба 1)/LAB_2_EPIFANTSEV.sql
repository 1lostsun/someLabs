USE AdventureWorksLT2019

1.1
SELECT DISTINCT City, StateProvince FROM SalesLT.Address;

1.2
SELECT * FROM SalesLT.Product
SELECT TOP 10 PERCENT Name, Weight FROM SalesLT.Product
WHERE Weight IS NOT NULL
ORDER BY Weight DESC;

1.3
SELECT Name, Weight FROM SalesLT.Product
WHERE Weight IS NOT NULL
ORDER BY Weight DESC
OFFSET 10 ROWS
FETCH NEXT 100 ROWS ONLY;

2.1
SELECT Name, Color, Size FROM SalesLT.Product
WHERE ProductModelID = 1;

2.2
SELECT ProductNumber, Name FROM SalesLT.Product
WHERE (Color IN ('black', 'red', 'white') AND Size IN ('S', 'M'));

2.3
SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%'

2.4
SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-__'