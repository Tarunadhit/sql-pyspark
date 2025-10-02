/*
-- ❓ Question
Find cities that have **both customers and suppliers**.  

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
INTERSECT
SELECT City FROM Suppliers;

/*
-- ✅ Result
| City |
|----------|
| New York |
| Chicago |

-- 🎉 Explanation
- `INTERSECT` returns only the **common rows** between two queries.  
- Here, the cities that appear in **both Customers and Suppliers** are listed.  
- Useful when finding **overlapping data sets** 🔗.
*/
