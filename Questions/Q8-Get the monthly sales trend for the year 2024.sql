/*
-- ❓ Question
Get the monthly sales trend for the year 2024.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- 📝 Sample Data
| OrderID | OrderDate | TotalAmount |
|---------|------------|-------------|
| 1 | 2024-01-15 | 200.00 |
| 2 | 2024-01-20 | 150.00 |
| 3 | 2024-02-10 | 300.00 |
| 4 | 2024-02-18 | 100.00 |
| 5 | 2024-03-05 | 250.00 |

*/

-- 💡 Solution
SELECT DATE_TRUNC('month', OrderDate) AS Month,
       SUM(TotalAmount) AS MonthlySales
FROM Orders
WHERE EXTRACT(YEAR FROM OrderDate) = 2024
GROUP BY DATE_TRUNC('month', OrderDate)
ORDER BY Month;

/*
-- 🎉 Explanation
By truncating dates to the month level, we group all orders within each month.  
The `SUM` function adds up the sales, giving us total monthly sales.  
This helps spot seasonality and trends in customer spending patterns!  

*/
