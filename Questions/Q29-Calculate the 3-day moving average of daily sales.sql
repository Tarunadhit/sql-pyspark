/*
-- ❓ Question
Calculate the 3-day moving average of daily sales.  

-- 📊 Sample Table(s)
CREATE TABLE DailySales (
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
| SaleDate | Amount |
|------------|--------|
| 2024-01-01 | 100 |
| 2024-01-02 | 200 |
| 2024-01-03 | 300 |
| 2024-01-04 | 400 |
| 2024-01-05 | 500 |

*/

-- 💡 Solution
SELECT 
    SaleDate,
    Amount,
    AVG(Amount) OVER (
        ORDER BY SaleDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg3Days
FROM DailySales
ORDER BY SaleDate;

/*
-- 🎉 Explanation
The window frame `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`  
looks at the current day plus the previous 2 days.  
We then apply `AVG()` to calculate the rolling 3-day average 📊.  
This smooths out daily fluctuations and shows trends better.
*/
