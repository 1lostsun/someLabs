USE AdventureWorksLT2019;
1.1

SELECT CompanyName, AddressLine1, City, AddressType = 'Billing'  FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Main Office';

1.2
SELECT CompanyName, AddressLine1, City, AddressType FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Shipping';

1.3

SELECT CompanyName, AddressLine1, City, AddressType = 'Billing'  FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Main Office'
UNION ALL 
SELECT CompanyName, AddressLine1, City, AddressType FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Shipping';

2.1
SELECT CompanyName FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Main Office'
EXCEPT
SELECT CompanyName FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Shipping';


2.2

SELECT CompanyName FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Main Office'
INTERSECT
SELECT CompanyName FROM SalesLT.Customer AS Customer
JOIN SalesLT.CustomerAddress AS CustomerAddress 
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN SalesLT.Address AS Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE AddressType = 'Shipping';
