/*
-- ❓ Question
Transfer ₹500 from one bank account to another using a SQL transaction safely.

-- 📊 Sample Table(s)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10,2)
);

-- 📝 Sample Data
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Tarun | 2000.00 |
| 2 | Rahul | 1500.00 |

*/

-- 💡 Solution
BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE AccountID = 1; -- Tarun sends ₹500

UPDATE Accounts
SET Balance = Balance + 500
WHERE AccountID = 2; -- Rahul receives ₹500

COMMIT;

/*

-- ✅ Result
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Tarun | 1500.00 |
| 2 | Rahul | 2000.00 |

-- 🎉 Explanation
- We use a **transaction** to make multiple operations act as a single unit.
- If any step fails, we can use **ROLLBACK** to undo changes.
- Ensures **ACID properties**:
  - **Atomicity** – All or nothing ✅  
  - **Consistency** – Keeps data valid ✅  
  - **Isolation** – Prevents dirty reads ✅  
  - **Durability** – Changes persist after commit ✅  
*/
