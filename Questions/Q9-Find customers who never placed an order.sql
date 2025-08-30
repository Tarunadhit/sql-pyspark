-- ❓ Question
/*
Find customers who never placed an order.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT
);

-- 📝 Sample Data 
| CustomerID | Name |
|------------|---------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

| OrderID | CustomerID |
|---------|------------|
| 101 | 1 |
| 102 | 1 |
| 103 | 3 |

*/

-- 💡 Solution
SELECT c.CustomerID, c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

/*
-- 🎉 Explanation
A `LEFT JOIN` keeps all customers, even if they don’t have matching orders.  
The `WHERE o.CustomerID IS NULL` condition filters only those customers with no orders,  
helping us find inactive customers.  
*/
