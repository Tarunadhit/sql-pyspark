/*
-- ❓ Question
Find how many cities have customers but no suppliers.  

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
| 4 | Daisy | Denver |

-- Suppliers
| SupplierID | SupplierName | City |
|------------|--------------|------------|
| 101 | Dell | Chicago |
| 102 | HP | Seattle |
| 103 | Lenovo | New York |

*/

-- 💡 Solution
SELECT COUNT(*) AS CitiesWithoutSuppliers
FROM (
    SELECT City FROM Customers
    EXCEPT
    SELECT City FROM Suppliers
) AS MissingCities;

/*
-- ✅ Result
| CitiesWithoutSuppliers |
|-------------------------|
| 2 |

-- 🎉 Explanation
- `EXCEPT` finds cities **in Customers but not in Suppliers**.  
- Wrapping it in a subquery lets us **count how many such cities** exist.  
- This quickly shows how many **unserved customer locations** remain 🚫🏙️.
*/
