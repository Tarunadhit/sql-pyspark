/*
-- ❓ Question
Simulate nested transactions using SAVEPOINT to control commits and rollbacks at different levels.

-- 📊 Sample Table(s)
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 📝 Sample Data
| EmpID | EmpName | Salary  |
|--------|----------|---------|
| 1      | Ravi     | 50000.00 |
| 2      | Sneha    | 60000.00 |
| 3      | Kiran    | 55000.00 |

*/
-- 💡 Solution
BEGIN TRANSACTION;

UPDATE Employees
SET Salary = Salary + 5000
WHERE EmpID = 1;  -- Outer transaction

SAVEPOINT InnerTrans;  -- Create inner transaction

UPDATE Employees
SET Salary = Salary + 5000
WHERE EmpID = 2;  -- Inner transaction step

-- ❌ Simulate an error in inner transaction
ROLLBACK TO InnerTrans;  -- Undo Sneha’s update only

COMMIT;  -- Commit Ravi’s update

SELECT * FROM Employees;
/*
-- ✅ Result
| EmpID | EmpName | Salary  |
|--------|----------|---------|
| 1      | Ravi     | 55000.00 |
| 2      | Sneha    | 60000.00 |
| 3      | Kiran    | 55000.00 |

-- 🎉 Explanation
- `SAVEPOINT` lets you create **nested checkpoints** inside a transaction.  
- You can **ROLLBACK TO** a specific savepoint without canceling everything.  
- Useful for:
  - Multi-step updates 👩‍💼  
  - Batch operations 💾  
  - Partial error handling while keeping valid changes ✅
- Demonstrates advanced **transaction control** and **fine-grained recovery**.
*/
