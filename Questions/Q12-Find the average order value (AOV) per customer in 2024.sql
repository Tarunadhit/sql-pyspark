/*
-- ❓ Question
Find the average order value (AOV) per customer in 2024.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- 📝 Sample Data 
| OrderID | CustomerID | OrderDate | TotalAmount |
|---------|------------|------------|-------------|
| 1 | 201 | 2024-01-10 | 120.00 |
| 2 | 202 | 2024-02-14 | 300.00 |
| 3 | 201 | 2024-02-28 | 180.00 |
| 4 | 203 | 2024-03-05 | 500.00 |
| 5 | 201 | 2024-04-01 | 200.00 |

*/

-- 💡 Solution
SELECT CustomerID,
       AVG(TotalAmount) AS AvgOrderValue
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2024
GROUP BY CustomerID
ORDER BY AvgOrderValue DESC;

/*
-- 🎉 Explanation
The `AVG` function calculates each customer’s average spending per order.  
Filtering to 2024 ensures we only look at this year’s orders.  
This metric (AOV) is super useful in e-commerce 📦 to understand spending behavior!  
*/
