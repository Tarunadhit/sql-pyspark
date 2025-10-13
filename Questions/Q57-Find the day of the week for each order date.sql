/*
-- ❓ Question
Find the day of the week for each order date.

-- 📊 Sample Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE
);

-- 📝 Sample Data
| OrderID | CustomerName | OrderDate |
|----------|---------------|------------|
| 1 | Aarav | 2024-09-01 |
| 2 | Priya | 2024-09-02 |
| 3 | Karan | 2024-09-03 |
| 4 | Meera | 2024-09-07 |

*/
-- 💡 Solution
SELECT 
    OrderID,
    CustomerName,
    OrderDate,
    DATEPART(WEEKDAY, OrderDate) AS DayOfWeek
FROM Orders;
/*
-- ✅ Result
| OrderID | CustomerName | OrderDate | DayOfWeek |
|----------|---------------|------------|------------|
| 1 | Aarav | 2024-09-01 | 1 |
| 2 | Priya | 2024-09-02 | 2 |
| 3 | Karan | 2024-09-03 | 3 |
| 4 | Meera | 2024-09-07 | 7 |

-- 🎉 Explanation
- `DATEPART()` extracts a specific **part of a date** (like year, month, or weekday).
- Here, it returns a number for the **day of the week** (1 = Sunday, 7 = Saturday).  
- Great for:
  - Weekly trend analysis 📅  
  - Checking weekend vs weekday orders 🛍️
*/
