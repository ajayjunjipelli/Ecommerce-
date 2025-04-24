CREATE DATABASE ECOMMERCEDB;

USE ECOMMERCEDB; 

--Create Tables Customers,Product,Order,OrderItem,Payment
--CREATE CUSTOMERS TABLE
CREATE Table Customers(
CustomerID INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Email VARCHAR(50),
C_Password VARCHAR(50),
C_Address VARCHAR(50));

--CREATE PRODUCTS TABLE
CREATE TABLE Products(
ProductID INT PRIMARY KEY,
Product_Name VARCHAR(50),
Price INT,
StockQuantity INT);

--CREATE ORDERS TABLE
CREATE TABLE ORDERS(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalCost INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));


--CREATE ORDERItem TABLE
CREATE TABLE ORDERITEM(
OrderItemID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

--CREATE TABLE Payments
CREATE TABLE PAYMENTS(
PaymentID INT PRIMARY KEY,
OrderId INT,
PaymentMethod VARCHAR(50),
FOREIGN KEY (OrderID) REFERENCES ORDERS (OrderID));


--INSERT VALUES for the Customers Table
INSERT INTO customers (CustomerID, Customer_Name, Email, C_Password, C_Address)
VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', '123 Main St'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password123', '456 Elm St'),
(3, 'Bob Johnson', 'bob.johnson@example.com', 'password123', '789 Oak St'),
(4, 'Alice Williams', 'alice.williams@example.com', 'password123', '1011 Maple St'),
(5, 'Mike Davis', 'mike.davis@example.com', 'password123', '1213 Pine St'),
(6, 'Emily Miller', 'emily.miller@example.com', 'password123', '1415 Cedar St'),
(7, 'David Wilson', 'david.wilson@example.com', 'password123', '1617 Spruce St'),
(8, 'Sarah Taylor', 'sarah.taylor@example.com', 'password123', '1819 Fir St'),
(9, 'Kevin White', 'kevin.white@example.com', 'password123', '2021 Birch St'),
(10, 'Lisa Harris', 'lisa.harris@example.com', 'password123', '2223 Beech St'),
(11, 'Peter Martin', 'peter.martin@example.com', 'password123', '2425 Ash St'),
(12, 'Helen Thompson', 'helen.thompson@example.com', 'password123', '2627 Cypress St'),
(13, 'Michael Jenkins', 'michael.jenkins@example.com', 'password123', '2829 Dogwood St'),
(14, 'Laura Russell', 'laura.russell@example.com', 'password123', '3031 Elm St'),
(15, 'Daniel Hall', 'daniel.hall@example.com', 'password123', '3233 Oak St');

--Insert Values for Products Table
INSERT INTO products (ProductID, Product_Name, Price, StockQuantity)
VALUES
(1, 'Apple iPhone 13', 999, 100),
(2, 'Samsung 4K TV', 1299, 50),
(3, 'Nike Air Max Shoes', 99, 200),
(4, 'Dell Inspiron Laptop', 699, 150),
(5, 'Sony PlayStation 5', 499, 100),
(6, 'Canon EOS Camera', 799, 50),
(7, 'LG Refrigerator', 1999, 20),
(8, 'Microsoft Xbox Series X', 599, 50),
(9, 'Asus ROG Gaming Laptop', 1499, 20),
(10, 'Bose SoundLink Speaker', 299, 100),
(11, 'HP Envy Laptop', 899, 50),
(12, 'JBL Flip Speaker', 99, 200),
(13, 'Lenovo ThinkPad Laptop', 1299, 20),
(14, 'Netgear Wi-Fi Router', 199, 100),
(15, 'Panasonic 4K Camera', 999, 20);

--Insert Values for Orders Table
INSERT INTO ORDERS (OrderID,CustomerID,OrderDate,TotalCost)
VALUES
(1, 1, '2022-01-01', 100.00),
  (2, 1, '2022-01-15', 200.00),
  (3, 2, '2022-02-01', 50.00),
  (4, 3, '2022-03-01', 150.00),
  (5, 1, '2022-04-01', 250.00),
  (6, 2, '2022-05-01', 75.00),
  (7, 3, '2022-06-01', 300.00),
  (8, 1, '2022-07-01', 400.00),
  (9, 2, '2022-08-01', 100.00),
  (10, 3, '2022-09-01', 200.00),
  (11, 1, '2022-10-01', 350.00),
  (12, 2, '2022-11-01', 125.00),
  (13, 3, '2022-12-01', 450.00),
  (14, 1, '2023-01-01', 500.00),
  (15, 2, '2023-02-01', 175.00);

--Insert Values for OrderItemI Table
INSERT INTO ORDERITEM(OrderItemID,OrderID,ProductID,Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 3, 1, 1),
(5, 3, 4, 1),
(6, 4, 5, 1),
(7, 5, 2, 1),
(8, 5, 6, 1),
(9, 6, 7, 1),
(10, 7, 8, 1),
(11, 7, 9, 1),
(12, 8, 10, 2),
(13, 9, 11, 1),
(14, 10, 12, 1),
(15, 10, 13, 1);

--Insert Values for Payments Table
INSERT INTO PAYMENTS(PaymentID,OrderId,PaymentMethod)
VALUES
(1, 1, 'Credit Card'),
(2, 2, 'PayPal'),
(3, 3, 'Bank Transfer'),
(4, 4, 'Credit Card'),
(5, 5, 'PayPal'),
(6, 6, 'Bank Transfer'),
(7, 7, 'Credit Card'),
(8, 8, 'PayPal'),
(9, 9, 'Bank Transfer'),
(10, 10, 'Credit Card'),
(11, 11, 'PayPal'),
(12, 12, 'Bank Transfer'),
(13, 13, 'Credit Card'),
(14, 14, 'PayPal'),
(15, 15, 'Bank Transfer');

--QUERY DATA

--Data Retreive
--Get all Customers Data
SELECT * FROM Customers;

--Get all Products Data
SELECT * FROM Products;

--Get all Orders Data
Select * from ORDERS;

--Get all OrderItem Data
SELECT *FROM ORDERITEM;

--Get all Payments Data
SELECT *FROM PAYMENTS;

--Get customer Order History
SELECT c.Customer_Name ,o.OrderID, o.OrderDate, oi.ProductID, p.Product_Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItem oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE c.CustomerID = 1;

--Get product Sales report
SELECT p.Product_Name, SUM(oi.Quantity) AS TotalQuantitySold
FROM Products p
JOIN OrderItem oi ON p.ProductID = oi.ProductID
GROUP BY p.Product_Name;

--SELECT, WHERE, ORDER BY, GROUP BY
--List each customer with their total number of orders, sorted by the most orders.
SELECT c.CustomerID, c.Customer_Name, COUNT(o.OrderID) AS Total_Orders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Customer_Name
ORDER BY Total_Orders DESC;

--JOINS (INNER, LEFT, RIGHT)
--Show all customers and their orders (use LEFT JOIN to include customers with no orders).
SELECT c.CustomerID, c.Customer_Name, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;

--Subquery
--Show products with a price higher than the average product price.
SELECT ProductID, Product_Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

--Aggregate Functions (SUM, AVG)
--Show the average total order cost and total revenue from all orders.
SELECT AVG(TotalCost) AS Average_Order_Value, SUM(TotalCost) AS Total_Revenue
FROM Orders;

--Create View
--Create a view showing customers and their total spend.
CREATE VIEW CustomerTotalSpend AS
SELECT c.CustomerID, c.Customer_Name, SUM(o.TotalCost) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Customer_Name;


-- Optimize with Index
--Create indexes to speed up common queries on Orders and OrderItem.
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_orderitem_orderid ON OrderItem(OrderID);
