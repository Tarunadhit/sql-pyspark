/*
-- ❓ Question
Use SAVEPOINT to partially roll back changes within a transaction.

-- 📊 Sample Table(s)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10,2)
);

-- 📝 Sample Data
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Neha | 4000.00 |
| 2 | Rohan | 2000.00 |
| 3 | Priya | 1000.00 |

*/

-- 💡 Solution
BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountID = 1; -- Neha sends ₹1000

SAVEPOINT Before_Rohan;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 2; -- Rohan receives ₹1000

-- ❌ Oops! Priya’s transfer failed
UPDATE Accounts
SET Balance = Balance + 500
WHERE AccountID = 999; -- Invalid ID

ROLLBACK TO Before_Rohan; -- Undo Priya’s part only

COMMIT;

SELECT * FROM Accounts;

/*
-- ✅ Result
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Neha | 3000.00 |
| 2 | Rohan | 3000.00 |
| 3 | Priya | 1000.00 |

-- 🎉 Explanation
- `SAVEPOINT` creates a **checkpoint** within a transaction.  
- When an error happens, you can **ROLLBACK TO** that point instead of undoing everything.  
- Great for multi-step operations like batch payments or order processing 💳.
- Demonstrates finer control over **Atomicity** and **Error Recovery**.
*/
