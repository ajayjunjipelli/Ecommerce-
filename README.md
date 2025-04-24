# 🛒 ECommerceDB – SQL for Data Analysis

## 📋 Description
**ECommerceDB** is a mini SQL project that models a simplified eCommerce system. It contains tables for customers, products, orders, order items, and payments. The project showcases key SQL concepts including data extraction, aggregation, joins, subqueries, views, and query optimization.

## 🛠️ Tools Used
- MySQL (or compatible DBMS)
- SQL (DDL, DML, Queries)

## 📂 Project Structure
- `ecommercedb.sql` – Contains schema creation, data population, and query scripts.
- `screenshots/` – Screenshots of executed queries.
- `README.md` – This file.

---

## 🧱 Database Schema Overview

Tables created:
```sql
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Customer_Name VARCHAR(50),
  Email VARCHAR(50),
  C_Password VARCHAR(50),
  C_Address VARCHAR(50)
);

CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  Product_Name VARCHAR(50),
  Price INT,
  StockQuantity INT
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalCost INT,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItem (
  OrderItemID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
  PaymentID INT PRIMARY KEY,
  OrderId INT,
  PaymentMethod VARCHAR(50),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
```

---

## 📊 Key SQL Queries & Concepts

### 🔍 Retrieve Customer Order History
```sql
SELECT c.Customer_Name, o.OrderID, o.OrderDate, oi.ProductID, p.Product_Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItem oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
WHERE c.CustomerID = 1;
```

### 📦 Product Sales Report
```sql
SELECT p.Product_Name, SUM(oi.Quantity) AS TotalQuantitySold
FROM Products p
JOIN OrderItem oi ON p.ProductID = oi.ProductID
GROUP BY p.Product_Name;
```

### 📈 Total Orders per Customer
```sql
SELECT c.CustomerID, c.Customer_Name, COUNT(o.OrderID) AS Total_Orders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Customer_Name
ORDER BY Total_Orders DESC;
```

### 🔁 LEFT JOIN – All Customers and Their Orders
```sql
SELECT c.CustomerID, c.Customer_Name, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;
```

### 🧠 Subquery – Products Priced Above Average
```sql
SELECT ProductID, Product_Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
```

### 💵 Order Stats – Avg Order Value & Total Revenue
```sql
SELECT AVG(TotalCost) AS Average_Order_Value, SUM(TotalCost) AS Total_Revenue
FROM Orders;
```

---

## 👁️ View – Total Customer Spend
```sql
CREATE VIEW CustomerTotalSpend AS
SELECT c.CustomerID, c.Customer_Name, SUM(o.TotalCost) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Customer_Name;
```

---

## ⚡ Optimization with Indexes
```sql
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_orderitem_orderid ON OrderItem(OrderID);
```

---

## 📸 Output Screenshots
All screenshots of query results are saved in the `screenshots/` folder.
