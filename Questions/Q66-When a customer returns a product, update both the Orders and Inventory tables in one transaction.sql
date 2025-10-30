/*
-- ❓ Question
When a customer returns a product, update both the Orders and Inventory tables in one transaction.

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    Status VARCHAR(20)
);

CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Stock INT
);

-- 📝 Sample Data
| Orders |                | Inventory |                |
|---------|----------------|------------|----------------|
| OrderID | ProductID | Quantity | Status  | ProductID | ProductName | Stock |
|----------|-----------|-----------|---------|------------|--------------|--------|
| 1        | 101       | 2         | Delivered | 101        | Headphones  | 10     |

*/
-- 💡 Solution
BEGIN TRANSACTION;

-- Step 1: Update order status to 'Returned'
UPDATE Orders
SET Status = 'Returned'
WHERE OrderID = 1;

-- Step 2: Add returned quantity back to inventory
UPDATE Inventory
SET Stock = Stock + (
    SELECT Quantity FROM Orders WHERE OrderID = 1
)
WHERE ProductID = (
    SELECT ProductID FROM Orders WHERE OrderID = 1
);

COMMIT;

SELECT * FROM Orders;
SELECT * FROM Inventory;
/*
-- ✅ Result
| OrderID | ProductID | Quantity | Status   |
|----------|------------|-----------|-----------|
| 1        | 101        | 2         | Returned  |

| ProductID | ProductName | Stock |
|------------|--------------|--------|
| 101        | Headphones   | 12     |

-- 🎉 Explanation
- Both updates happen **together in one transaction**.
- If either fails, a **ROLLBACK** ensures no partial updates occur.
- Demonstrates:
  - **Atomicity** → all or nothing ✅  
  - **Consistency** → order and stock stay in sync 🔄  
  - Perfect for e-commerce return processing 💼
*/
