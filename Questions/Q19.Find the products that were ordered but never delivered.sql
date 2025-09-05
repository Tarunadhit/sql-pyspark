/*
-- ❓ Question
Find the products that were ordered but never delivered.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    Status VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100)
);

-- 📝 Sample Data
| ProductID | ProductName |
|-----------|---------------|
| 1 | Laptop |
| 2 | Smartphone |
| 3 | Headphones |

| OrderID | ProductID | Status |
|---------|-----------|-------------|
| 101 | 1 | Delivered |
| 102 | 2 | Cancelled |
| 103 | 2 | Delivered |
| 104 | 3 | Pending |
| 105 | 1 | Shipped |

*/

-- 💡 Solution
SELECT p.ProductID, p.ProductName
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.Status NOT IN ('Delivered');

/*

-- 🎉 Explanation
We join products with their orders  
and filter out any that have not yet been delivered.  
Statuses like `Pending`, `Shipped`, or `Cancelled` will show up,  
helping track **at-risk products 🚚❌**.

*/
