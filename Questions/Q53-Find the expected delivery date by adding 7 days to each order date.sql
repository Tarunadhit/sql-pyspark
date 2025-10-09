/*
-- ❓ Question
Find the expected delivery date by adding 7 days to each order date.

-- 📊 Sample Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);

-- 📝 Sample Data
| OrderID | OrderDate |
|----------|------------|
| 1 | 2024-01-01 |
| 2 | 2024-02-10 |
| 3 | 2024-03-25 |

*/
-- 💡 Solution
SELECT 
    OrderID,
    OrderDate,
    DATEADD(DAY, 7, OrderDate) AS ExpectedDeliveryDate
FROM Orders;

/*
-- ✅ Result
| OrderID | OrderDate | ExpectedDeliveryDate |
|----------|-------------|----------------------|
| 1 | 2024-01-01 | 2024-01-08 |
| 2 | 2024-02-10 | 2024-02-17 |
| 3 | 2024-03-25 | 2024-04-01 |

-- 🎉 Explanation
- `DATEADD(interval, number, date)` adds (or subtracts if number is negative) a specific time interval.  
- Here, we added **7 days** to find the **expected delivery date**.  
- Useful in **shipment tracking**, **due date calculation**, etc.
*/
