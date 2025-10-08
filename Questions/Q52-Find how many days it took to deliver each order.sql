/*
-- ❓ Question
Find how many days it took to deliver each order.  

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    DeliveryDate DATE
);

-- 📝 Sample Data
| OrderID | OrderDate | DeliveryDate |
|---------|-------------|--------------|
| 1 | 2024-01-01 | 2024-01-05 |
| 2 | 2024-01-10 | 2024-01-15 |
| 3 | 2024-02-01 | 2024-02-03 |

*/
-- 💡 Solution
SELECT 
    OrderID,
    OrderDate,
    DeliveryDate,
    DATEDIFF(DAY, OrderDate, DeliveryDate) AS DeliveryDays
FROM Orders;

/*

-- ✅ Result
| OrderID | OrderDate | DeliveryDate | DeliveryDays |
|---------|-------------|--------------|--------------|
| 1 | 2024-01-01 | 2024-01-05 | 4 |
| 2 | 2024-01-10 | 2024-01-15 | 5 |
| 3 | 2024-02-01 | 2024-02-03 | 2 |

-- 🎉 Explanation
- `DATEDIFF()` calculates the **difference between two dates**.  
- Here, it shows **how many days** each order took to deliver.  
- A must-have for tracking **delivery performance ⏱️**.
*/
