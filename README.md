# ECommerceDB - SQL Data Analysis Project

This project showcases the creation and analysis of a simplified eCommerce database using SQL. It includes table creation, data insertion, and a variety of SQL operations such as SELECT, JOINs, subqueries, views, and query optimization with indexes.

## 📁 Database Name
`ECommerceDB`

---

## 🗂️ Tables Created
- **Customers**: Stores customer information.
- **Products**: Contains product details.
- **Orders**: Records orders placed by customers.
- **OrderItem**: Represents items in each order.
- **Payments**: Stores payment method details for orders.

---

## 🧾 Sample Data
All tables are pre-populated with realistic sample data for:
- 15 customers
- 15 products
- 15 orders with corresponding order items
- 15 payment records

---

## 🔍 Key SQL Queries Demonstrated

### ✅ Data Retrieval
- Fetching all records from each table.
- Customer-specific order history.
- Product sales summary by quantity sold.

### 🔎 Data Analysis
- Total orders by each customer (with sorting).
- LEFT JOIN to show all customers including those with no orders.
- Subquery to find products priced above average.
- Aggregate functions for average order value and total revenue.

### 🧱 Views
- `CustomerTotalSpend`: A view showing total spend per customer.

### 🚀 Performance Optimization
- Indexes created on frequently queried fields:
  - `Orders(CustomerID)`
  - `OrderItem(OrderID)`

---

## 📊 Purpose
This project is intended for:
- Practicing SQL for Data Analysis
- Demonstrating database normalization
- Exploring query performance enhancement techniques

---

