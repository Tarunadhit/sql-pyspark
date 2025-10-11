/*
-- ❓ Question
Find how many days have passed since each order was placed.

-- 📊 Sample Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE
);

-- 📝 Sample Data
| OrderID | CustomerName | OrderDate |
|----------|---------------|------------|
| 1 | Rahul | 2024-10-01 |
| 2 | Priya | 2024-09-25 |
| 3 | Arjun | 2024-10-07 |

*/

-- 💡 Solution
SELECT 
    OrderID,
    CustomerName,
    OrderDate,
    DATEDIFF(DAY, OrderDate, GETDATE()) AS DaysSinceOrder
FROM Orders;

/*

-- ✅ Result (Assuming today = 2024-10-10)
| OrderID | CustomerName | OrderDate | DaysSinceOrder |
|----------|---------------|------------|----------------|
| 1 | Rahul | 2024-10-01 | 9 |
| 2 | Priya | 2024-09-25 | 15 |
| 3 | Arjun | 2024-10-07 | 3 |

-- 🎉 Explanation
- `DATEDIFF()` calculates the **difference between two dates**.
- The first argument (`DAY`) specifies the unit (can be YEAR, MONTH, etc.).
- Commonly used to find:
  - Customer inactivity days 💤
  - Time since order, signup, or delivery
  - SLA or delay calculations
*/
