/*
-- ❓ Question
Extract the year, month, and day from each order date.

-- 📊 Sample Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);

-- 📝 Sample Data
| OrderID | OrderDate |
|----------|------------|
| 1 | 2024-01-15 |
| 2 | 2024-06-28 |
| 3 | 2024-11-05 |
*/
-- 💡 Solution
SELECT 
    OrderID,
    OrderDate,
    DATEPART(YEAR, OrderDate) AS OrderYear,
    DATEPART(MONTH, OrderDate) AS OrderMonth,
    DATEPART(DAY, OrderDate) AS OrderDay
FROM Orders;
/*
-- ✅ Result
| OrderID | OrderDate | OrderYear | OrderMonth | OrderDay |
|----------|-------------|------------|-------------|-----------|
| 1 | 2024-01-15 | 2024 | 1 | 15 |
| 2 | 2024-06-28 | 2024 | 6 | 28 |
| 3 | 2024-11-05 | 2024 | 11 | 5 |

-- 🎉 Explanation
- `DATEPART()` extracts numeric parts of a date (like 1 for January).
- `DATENAME()` can be used to extract the **text name** of the part, e.g.:
  ```sql
  SELECT DATENAME(MONTH, OrderDate) AS MonthName FROM Orders;
*/
