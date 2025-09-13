/*
-- ❓ Question
Find the latest order placed by each customer.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
| OrderID | CustomerID | OrderDate | Amount |
|---------|------------|------------|--------|
| 101 | 1 | 2024-01-10 | 200 |
| 102 | 1 | 2024-02-15 | 150 |
| 103 | 2 | 2024-01-20 | 300 |
| 104 | 2 | 2024-03-05 | 400 |
| 105 | 3 | 2024-02-01 | 500 |

*/

-- 💡 Solution
SELECT OrderID, CustomerID, OrderDate, Amount
FROM (
    SELECT 
        OrderID,
        CustomerID,
        OrderDate,
        Amount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn
    FROM Orders
) sub
WHERE rn = 1;

/*
-- 🎉 Explanation
We use `ROW_NUMBER()` to rank orders for each customer  
based on the latest `OrderDate`.  
Filtering `rn = 1` picks only the most recent order 🛒⏱️.
*/
