/*
-- ❓ Question
Delete all orders from the `Orders` table where the customer is inactive (not present in the `ActiveCustomers` table).  

-- 📊 Sample Tables
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE ActiveCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- 📝 Sample Data
-- Orders
| OrderID | CustomerID | OrderDate |
|---------|------------|-------------|
| 1 | 101 | 2024-01-10 |
| 2 | 102 | 2024-02-15 |
| 3 | 103 | 2024-03-05 |

-- ActiveCustomers
| CustomerID | CustomerName |
|------------|--------------|
| 101 | Alice |
| 103 | Charlie |

*/
-- 💡 Solution
DELETE FROM Orders
WHERE CustomerID NOT IN (
    SELECT CustomerID FROM ActiveCustomers
);

/*
-- 📝 Result (Orders after DELETE)
| OrderID | CustomerID | OrderDate |
|---------|------------|-------------|
| 1 | 101 | 2024-01-10 |
| 3 | 103 | 2024-03-05 |

-- 🎉 Explanation
- The subquery finds **active customers**.  
- `NOT IN` removes orders linked to inactive ones.  
- Order with `CustomerID = 102` is deleted because Bob is not active ❌.  
*/
