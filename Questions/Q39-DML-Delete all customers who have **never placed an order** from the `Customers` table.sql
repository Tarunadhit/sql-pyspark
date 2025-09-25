/*
-- ❓ Question
Delete all customers who have **never placed an order** from the `Customers` table.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
-- Customers
| CustomerID | Name |
|------------|---------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |
| 4 | David |

-- Orders
| OrderID | CustomerID | Amount |
|---------|------------|--------|
| 101 | 1 | 200 |
| 102 | 3 | 150 |

*/

-- 💡 Solution
DELETE FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
);

/*

-- 📝 Result (Customers after delete)
| CustomerID | Name |
|------------|---------|
| 1 | Alice |
| 3 | Charlie |

-- 🎉 Explanation
- We used a **subquery** to get all `CustomerID`s from the `Orders` table.  
- The `NOT IN` ensures only those **without orders** are deleted.  
- Helps in **data cleanup** (removing inactive or unused records).  

*/
