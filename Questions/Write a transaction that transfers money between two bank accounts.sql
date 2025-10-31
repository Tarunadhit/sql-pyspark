/*
-- ❓ Question
Write a transaction that transfers money between two bank accounts.  
If any error occurs (like insufficient balance), roll back the entire transaction using TRY...CATCH.

-- 📊 Sample Table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountName VARCHAR(50),
    Balance DECIMAL(10,2)
);

-- 📝 Sample Data
| AccountID | AccountName | Balance |
|------------|--------------|----------|
| 1          | Tarun        | 5000.00  |
| 2          | Abhishek     | 3000.00  |

*/
-- 💡 Solution (SQL Server style)
BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @TransferAmount DECIMAL(10,2) = 2000;

    -- Step 1: Deduct from sender
    UPDATE Accounts
    SET Balance = Balance - @TransferAmount
    WHERE AccountID = 1;

    -- Step 2: Add to receiver
    UPDATE Accounts
    SET Balance = Balance + @TransferAmount
    WHERE AccountID = 2;

    -- Check for negative balance (simulate an error)
    IF (SELECT Balance FROM Accounts WHERE AccountID = 1) < 0
        THROW 50001, 'Insufficient funds!', 1;

    COMMIT TRANSACTION;
    PRINT '✅ Transaction Successful!';
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT '❌ Transaction Failed: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Accounts;
/*
-- 🎉 Explanation
- `BEGIN TRY...END TRY` runs normal logic.
- If an error occurs, `BEGIN CATCH...END CATCH` executes.
- Ensures:
  - **Atomicity**: either both accounts update or none.
  - **Consistency**: balances remain accurate.
  - **Durability**: committed changes stay safe.
*/
