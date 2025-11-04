/*
-- ❓ Question
Create a view that shows each customer’s total number of orders.

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    TotalAmount DECIMAL(10,2)
);

-- 📝 Sample Data
| CustomerID | CustomerName |
|-------------|---------------|
| 1           | Arjun         |
| 2           | Priya         |
| 3           | Kiran         |

| OrderID | CustomerID | TotalAmount |
|----------|-------------|-------------|
| 101      | 1           | 500.00      |
| 102      | 1           | 700.00      |
| 103      | 2           | 300.00      |
*/
-- 💡 Solution
CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;
/*
-- 🎉 Explanation
A **VIEW** is like a “virtual table” that saves a query for later reuse.  
Here, the view `CustomerOrderSummary` dynamically shows how many orders each customer has.  
You can query it like a regular table:
```sql
SELECT * FROM CustomerOrderSummary;
*/
