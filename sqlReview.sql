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
SELECT MIN(price) AS smallestPrice FROM Products;
SELECT MAX(Price) AS LargestPrice FROM Products;
SELECT AVG(Price) FROM Products;
SELECT SUM(Quantity) FROM OrderDetail;
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE Country IN ('Germany','France');
SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers);
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID NOT IN(1,2,3);
SELECT * FROM Products WHERE ProductName BETWEEN 'Tiger' AND 'Mozzarella'
ORDER By ProductName;
SELECT CustomerName AS Customers, ContactName AS "Contact Person" FROM Customers;
SELECT Orders.OrderID, Customers.CustomerName FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM((Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.shipperID = Shipper.shipperID);
