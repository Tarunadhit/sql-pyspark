/*
-- ❓ Question
Simulate a deadlock situation and show how changing the locking order can prevent it.

-- 📊 Sample Table(s)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10,2)
);

-- 📝 Sample Data
| AccountID | AccountHolder | Balance  |
|------------|---------------|----------|
| 1          | Arjun         | 3000.00  |
| 2          | Bhavna        | 2500.00  |
*/
-- 💡 Solution
-- 🧵 Session 1
BEGIN TRANSACTION;
UPDATE Accounts SET Balance = Balance - 100 WHERE AccountID = 1;
-- Waits to update AccountID = 2

-- 🧵 Session 2
BEGIN TRANSACTION;
UPDATE Accounts SET Balance = Balance - 200 WHERE AccountID = 2;
-- Waits to update AccountID = 1 → ❌ Deadlock!

-- 💡 Fix:
-- Always access tables in the same order to prevent circular locks.
BEGIN TRANSACTION;
UPDATE Accounts SET Balance = Balance - 100 WHERE AccountID = 1;
UPDATE Accounts SET Balance = Balance - 200 WHERE AccountID = 2;
COMMIT;
/*
-- ✅ Result
| AccountID | AccountHolder | Balance  |
|------------|---------------|----------|
| 1          | Arjun         | 2900.00  |
| 2          | Bhavna        | 2300.00  |

-- 🎉 Explanation
- A **deadlock** happens when two transactions wait for each other’s lock forever. 🔄  
- Prevented by:
  - Locking resources in a **consistent order** ✅  
  - Keeping transactions **short** ⏱️  
  - Using **timeouts or retries** 🔁  
- This ensures smooth concurrency while maintaining **isolation**.
*/
