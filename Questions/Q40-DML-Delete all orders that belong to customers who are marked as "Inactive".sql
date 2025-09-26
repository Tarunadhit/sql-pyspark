/*
-- ❓ Question
Delete all orders that belong to customers who are marked as "Inactive".  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Status VARCHAR(20) -- 'Active' or 'Inactive'
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
-- Customers
| CustomerID | Name | Status |
|------------|---------|----------|
| 1 | Alice | Active |
| 2 | Bob | Inactive |
| 3 | Charlie | Active |
| 4 | David | Inactive |

-- Orders
| OrderID | CustomerID | Amount |
|---------|------------|--------|
| 101 | 1 | 200 |
| 102 | 2 | 150 |
| 103 | 3 | 300 |
| 104 | 4 | 400 |

*/
-- 💡 Solution
DELETE O
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE C.Status = 'Inactive';
/*
-- 📝 Result (Orders after delete)
| OrderID | CustomerID | Amount |
|---------|------------|--------|
| 101 | 1 | 200 |
| 103 | 3 | 300 |

-- 🎉 Explanation
- We joined **Orders** with **Customers**.  
- Any order linked to a customer with `Status = 'Inactive'` is removed.  
- This is useful for cleaning up dependent records when a parent entity is inactive.
*/
