/*
-- ❓ Question
Simulate a failed transaction while transferring money and use ROLLBACK to restore the original balances.

-- 📊 Sample Table(s)
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10,2)
);

-- 📝 Sample Data
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Meera | 3000.00 |
| 2 | Aarav | 1000.00 |

*/
-- 💡 Solution
BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE AccountID = 1; -- Meera sends ₹500

-- ❌ Simulated error: Aarav’s account doesn’t exist
UPDATE Accounts
SET Balance = Balance + 500
WHERE AccountID = 999; -- Invalid AccountID

ROLLBACK;

SELECT * FROM Accounts;

/*
-- ✅ Result
| AccountID | AccountHolder | Balance |
|------------|---------------|----------|
| 1 | Meera | 3000.00 |
| 2 | Aarav | 1000.00 |

-- 🎉 Explanation
- The second update fails because AccountID **999** doesn’t exist.  
- SQL detects the error and the **ROLLBACK** command undoes all previous changes.  
- Ensures **Atomicity** — either **all** statements succeed or **none** do.  
- Useful in real-world banking or payment systems to prevent partial transfers 💸.
*/
