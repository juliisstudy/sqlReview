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
SELECT Customers.CustomerName, Orders.OrderID FROM Customers
LEFT JOIN Orders On Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
SELECT Orders.OrderID, Employess.LastName, Employess.FirstName
FROM Orders RIGHT JOIN Employess ON Orders.EmployessID = Employess.EmployessID
ORDER BY Orders.OrderID;
SELECT Customers.CustomerName,Ordes.OrderID FROM Customers CROSS JOIN Orders;
SELECT City FROM Customers UNION SELECT City FROM Suppliers 
ORDER BY City;
SELECT City, Country FROM Customers WHERE Country = 'Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country = 'Germany' ORDER By City;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY County;
SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country 
ORDER BY COUNT(CustomerID) DESC;
SELECT COUNT(CustomerID),Country FROM Customers GROUP BY Country 
HAVING COUNT(CustomerID) > 5;
SELECT SupplierName FROM Supplier 
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.Supplier = Suppliers.supplierID AND Price < 20);
SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails
WHERE Quantity = 10);
INSERT INTO Customers(CustomerName, ContactName,Country)
SELECT SupplierName, Contact, Country FROM Suppliers;
SELECT OrderID,Quantity,
CASE 
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS quantityText
FROM OrderDetails;
SELECT ProductName, UnitPrice * (UnitesInStock + IFNULL(UnitsOnOrder,0))
FROM Products;
SELECT ProductName, UnitPrice *(UnitesInStock + COALESCE(UnitsOnOrder,0))
FROM Products;
CREATE DATABASE testDB;
DROP DATABASE testDB;
CREATE TABLE Person (PersonID int, 
                     LastName varchar(255),
                     FirstName varchar(255),
                     Address varchar(255),
                     City varchar(255));
DROP TABLE Shipers;
ALTER TABLE Customers ADD Email varchar(255);
ALTER TABLE Customers DROP COLUMN Email;
CREATE TABLE Person (ID int NOT NULL,
                    LastName varchar(255) NOT NULL,
                    FirstName varchar(255) NOT NULL,
                    Age int
                    );
CREATE TABLE Persons (ID int NOT NULL,
                     LastName varchar(255) NOT NULL,
                     FirstName varchar(255),
                     Age int,
                     UNIQUE(ID));
CREATE TABLE Persons (ID int NOT NULL,
                     LastName varchar(255) NOT NULL,
                     FirstName varchar(255),
                     Age int,
                     CONSTRAINT UC_Person UNIQUE(ID,LastName));
CREATE TABLE Person (
                    ID int NOT NULL,
                    LastName varchar(255) NOT NULL,
                    FirstName varchar(255),
                    Age int,
                    PRIMARY KEY(ID));
ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);
CREATE TABLE Order (
                    OrderID int NOT NULL,
                    OrderNumber int NOT NULL,
                    PersonID int,
                    PRIMARY KEY (OrderID),
                    FOREIGN KEY (Person) REFERENCES Person(PersonID)); 
CREAT TABLE Person (
                    ID int NOT NULL,
                    LastName varchar(255) NOT NULL,
                    FirstName varchar(255),
                    CONSTRAINT CHK_Person CHECK (Age >= 18 AND City='Beijing'));
ALTER TABLE Person DROP CHECK CHK_Person;

CREAT VIEW [Products Above Average Price] AS
SELECT ProductName, Price FROM Products 
WHERE Price > (SELECT AVG(Price) FROM Products);

DROP VIEW [Products Above Average Price];



