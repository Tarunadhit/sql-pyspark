/*
-- ❓ Question
List all unique cities where either customers or suppliers are located.  

-- 📊 Sample Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data
-- Customers
| CustomerID | CustomerName | City |
|------------|--------------|------------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | Boston |

-- Suppliers
| SupplierID | SupplierName | City |
|------------|--------------|------------|
| 101 | Dell | Chicago |
| 102 | HP | Seattle |
| 103 | Lenovo | New York |

*/

-- 💡 Solution
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

/*
-- ✅ Result
| City |
|----------|
| New York |
| Chicago |
| Boston |
| Seattle |
*/

-- 🎉 Explanation
- `UNION` combines results from two tables.  
- It automatically removes **duplicates** (like New York & Chicago).  
- Great for combining data sources into a single list 🔄.
