/*
-- ❓ Question
Find the year, month, and day for each order in the `Orders` table.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data
| OrderID | OrderDate | Amount |
|---------|------------|--------|
| 101 | 2024-01-15 | 200 |
| 102 | 2024-02-20 | 150 |
| 103 | 2024-03-05 | 300 |

*/

-- 💡 Solution
SELECT 
    OrderID,
    OrderDate,
    EXTRACT(YEAR FROM OrderDate) AS OrderYear,
    EXTRACT(MONTH FROM OrderDate) AS OrderMonth,
    EXTRACT(DAY FROM OrderDate) AS OrderDay
FROM Orders;

/*

-- ✅ Result
| OrderID | OrderDate | OrderYear | OrderMonth | OrderDay |
|---------|------------|-----------|------------|----------|
| 101 | 2024-01-15 | 2024 | 1 | 15 |
| 102 | 2024-02-20 | 2024 | 2 | 20 |
| 103 | 2024-03-05 | 2024 | 3 | 5 |

-- 🎉 Explanation
- `EXTRACT()` breaks down a date into **year, month, and day**.  
- Useful for **time-based analysis**, like monthly sales trends or daily reporting 📊.
*/
