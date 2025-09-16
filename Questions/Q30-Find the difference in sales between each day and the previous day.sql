/*
-- ❓ Question
Find the difference in sales between each day and the previous day.  

-- 📊 Sample Table(s)
CREATE TABLE DailySales (
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
| SaleDate | Amount |
|------------|--------|
| 2024-01-01 | 100 |
| 2024-01-02 | 150 |
| 2024-01-03 | 120 |
| 2024-01-04 | 180 |
| 2024-01-05 | 200 |

*/

-- 💡 Solution
SELECT 
    SaleDate,
    Amount,
    Amount - LAG(Amount, 1, 0) OVER (ORDER BY SaleDate) AS DifferenceFromPrevDay
FROM DailySales
ORDER BY SaleDate;

/*
-- 🎉 Explanation
We use `LAG()` to look at the **previous day's sales**.  
Subtracting gives the difference compared to yesterday.  
This highlights **daily growth or drop 📉📈** in sales.
*/
