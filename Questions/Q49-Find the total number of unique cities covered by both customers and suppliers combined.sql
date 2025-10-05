/*
-- ❓ Question
Find the total number of unique cities covered by both customers and suppliers combined.  

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
SELECT COUNT(DISTINCT City) AS TotalUniqueCities
FROM (
    SELECT City FROM Customers
    UNION
    SELECT City FROM Suppliers
) AS CombinedCities;
/*
-- ✅ Result
| TotalUniqueCities |
|-------------------|
| 4                 |

-- 🎉 Explanation
- First, `UNION` merges cities from both tables and removes duplicates.  
- Then, `COUNT(DISTINCT City)` finds how many unique cities exist overall.  
- A great way to measure **combined geographic reach 🌍**.
*/
