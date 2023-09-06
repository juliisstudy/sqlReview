SELECT * FROM Customers;
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
SELECT * FROM Customers WHERE Country = 'Mexico';
SELECT * FROM Customers WHERE CustomerID = 1;
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin';
SELECT * FROM Customers WHERE Country = 'Germany' OR City = 'Berlin';
SELECT * FROM Customers WHERE NOT Country = 'Germany';
SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart');
SELECT * FROM Customers ORDER BY Country;
SELECT * FROM Customers ORDER BY Country DESC;
SELECT * FROM Customers ORDER BY Country, CustomerName;
SELECT * FROM Customers ORDER BY Country ASD, CustomerName DESC;
INSERT INTO Customers (CustomerName, ContactName, Address,City,PostalCode,Country)
VALUES('Cardinal','Tom','21','Stavanger','4006','Norway');
SELECT * FROM Customers WHERE CustomerName IS NULL;
SELECT * FROM Customers WHERE CustomerName IS NOT NULL;
UPDATE Customers SET ContactName = 'AS',City ='Frank'
WHERE CustomerID = 1;
DELETE FROM Customers WHERE CustomerName IS NULL;
DELETE FROM Customers;
SELECT * FROM Customers WHERE Country = 'Germany' LIMIT 5;  
