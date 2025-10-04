/*
-- ❓ Question
List all cities from customers and suppliers, **including duplicates**.  

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
| CustomerID | CustomerName | City       |
|------------|--------------|------------|
| 1          | Alice        | New York   |
| 2          | Bob          | Chicago    |
| 3          | Charlie      | Boston     |

-- Suppliers
| SupplierID | SupplierName | City       |
|------------|--------------|------------|
| 101        | Dell         | Chicago    |
| 102        | HP           | Seattle    |
| 103        | Lenovo       | New York   |

*/
-- 💡 Solution
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers;

/*
-- ✅ Result
| City     |
|----------|
| New York |
| Chicago  |
| Boston   |
| Chicago  |
| Seattle  |
| New York |

-- 🎉 Explanation
- `UNION ALL` **combines two datasets** but **keeps duplicates**.  
- Useful when you need the **full data including repeats** (e.g., total entries or frequency counts).  
- Unlike `UNION`, it **does not remove duplicates** ❌.
*/
