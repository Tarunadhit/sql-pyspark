/*
-- ❓ Question
Demonstrate the effect of different transaction isolation levels in SQL using READ COMMITTED and READ UNCOMMITTED.

-- 📊 Sample Table(s)
CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Stock INT
);

-- 📝 Sample Data
| ProductID | ProductName | Stock |
|------------|--------------|--------|
| 1 | Laptop | 50 |
| 2 | Mouse | 200 |
*/
-- 💡 Solution
-- 🧠 Transaction 1 (Session A)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SELECT * FROM Inventory; -- Can see uncommitted (dirty) data
COMMIT;

-- ⚙️ Transaction 2 (Session B)
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE Inventory
SET Stock = Stock - 10
WHERE ProductID = 1; -- Still uncommitted

-- Transaction 1 can see this dirty data in READ UNCOMMITTED mode!
ROLLBACK;
/*
-- ✅ Result (final view after rollback)
| ProductID | ProductName | Stock |
|------------|--------------|--------|
| 1 | Laptop | 50 |
| 2 | Mouse | 200 |

-- 🎉 Explanation
- **READ UNCOMMITTED** → Can see uncommitted changes (Dirty Reads 🧨)
- **READ COMMITTED** → Only reads committed data (Safe for production ✅)
- Isolation levels define how much one transaction is protected from others’ changes.
- Higher levels like **REPEATABLE READ** and **SERIALIZABLE** offer more safety but less concurrency ⚖️.
*/
