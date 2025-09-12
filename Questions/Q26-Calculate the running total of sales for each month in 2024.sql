/*

-- ❓ Question
Calculate the running total of sales for each month in 2024.  

-- 📊 Sample Table(s)
CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data (only small input example, not inserts)
| SaleID | SaleDate | Amount |
|--------|------------|--------|
| 1 | 2024-01-05 | 100 |
| 2 | 2024-01-15 | 200 |
| 3 | 2024-02-10 | 150 |
| 4 | 2024-02-25 | 300 |
| 5 | 2024-03-03 | 250 |

*/

-- 💡 Solution
SELECT 
    DATE_TRUNC('month', SaleDate) AS Month,
    SUM(Amount) AS MonthlySales,
    SUM(SUM(Amount)) OVER (ORDER BY DATE_TRUNC('month', SaleDate)) AS RunningTotal
FROM Sales
WHERE EXTRACT(YEAR FROM SaleDate) = 2024
GROUP BY DATE_TRUNC('month', SaleDate)
ORDER BY Month;

/*
-- 🎉 Explanation
First, we group sales by month using `DATE_TRUNC`.  
Then we apply a **window SUM()** over time to get the running total.  
This shows how sales **accumulate month by month 📈**.
*/
