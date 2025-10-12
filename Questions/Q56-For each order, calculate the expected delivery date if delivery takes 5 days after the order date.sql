/*
-- ❓ Question
For each order, calculate the expected delivery date if delivery takes 5 days after the order date.

-- 📊 Sample Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE
);

-- 📝 Sample Data
| OrderID | CustomerName | OrderDate |
|----------|---------------|------------|
| 1 | Asha | 2024-10-01 |
| 2 | Raj | 2024-10-03 |
| 3 | Neha | 2024-10-05 |

*/

-- 💡 Solution
SELECT 
    OrderID,
    CustomerName,
    OrderDate,
    DATEADD(DAY, 5, OrderDate) AS ExpectedDeliveryDate
FROM Orders;

/*
-- ✅ Result
| OrderID | CustomerName | OrderDate | ExpectedDeliveryDate |
|----------|---------------|------------|-----------------------|
| 1 | Asha | 2024-10-01 | 2024-10-06 |
| 2 | Raj | 2024-10-03 | 2024-10-08 |
| 3 | Neha | 2024-10-05 | 2024-10-10 |

-- 🎉 Explanation
- `DATEADD()` adds a specific time interval to a date.
- Here, we add **5 days** to the order date.
- Useful for:
  - Estimating delivery dates 🚚
  - Calculating expiry dates 🧾
  - Scheduling tasks automatically ⏰
*/
