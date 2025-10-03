/*
-- ❓ Question
Find cities where customers live but no suppliers exist.  

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
| 103        | Lenovo       | New York   |4

*/

-- 💡 Solution
SELECT City FROM Customers
EXCEPT
SELECT City FROM Suppliers;

/*
-- ✅ Result
| City   |
|--------|
| Boston |

-- 🎉 Explanation
- `EXCEPT` gives rows in the **first query but not in the second**.  
- Here, only **Boston** is in Customers but missing from Suppliers.  
- Handy to find **mismatches or gaps** between two data sets 🔍.
*/
