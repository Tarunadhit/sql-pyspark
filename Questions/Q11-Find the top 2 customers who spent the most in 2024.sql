/*
-- ❓ Question
Find the top 2 customers who spent the most in 2024.  

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
| 1 | 101 | 2024-01-15 | 200.00 |
| 2 | 102 | 2024-02-10 | 500.00 |
| 3 | 101 | 2024-03-05 | 300.00 |
| 4 | 103 | 2023-12-20 | 400.00 |
| 5 | 102 | 2024-04-18 | 250.00 |

*/

-- 💡 Solution
SELECT CustomerID,
       SUM(TotalAmount) AS TotalSpent
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2024
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 2;

/*
-- 🎉 Explanation
We filter orders to 2024, then sum each customer’s spending.  
`GROUP BY` ensures totals per customer, and ordering by `TotalSpent` highlights the biggest spenders.  
Finally, `LIMIT 2` gives us just the **top 2** high-value customers!  
*/
