/*
-- ❓ Question
Calculate each customer’s running total of purchases over time.  

-- 📊 Sample Table(s)
CREATE TABLE Sales (
    CustomerID INT,
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data (only small input example, not inserts)
| CustomerID | SaleDate | Amount |
|------------|------------|--------|
| 1 | 2024-01-01 | 100 |
| 1 | 2024-01-05 | 200 |
| 1 | 2024-01-10 | 150 |
| 2 | 2024-01-03 | 300 |
| 2 | 2024-01-08 | 100 |

*/

-- 💡 Solution
SELECT 
    CustomerID,
    SaleDate,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY CustomerID 
        ORDER BY SaleDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Sales
ORDER BY CustomerID, SaleDate;

/*

-- 🎉 Explanation
We use `SUM() OVER` with a window:  
- `PARTITION BY CustomerID` → restart the total for each customer.  
- `ORDER BY SaleDate` → accumulate in date order.  
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` → include all rows up to the current one.
This shows how each customer’s **spending grows cumulatively 💰📈** over time.
*/
