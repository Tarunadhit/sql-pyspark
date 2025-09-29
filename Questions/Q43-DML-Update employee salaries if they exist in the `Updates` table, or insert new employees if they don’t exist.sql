/*
-- ❓ Question
Update employee salaries if they exist in the `Updates` table, or insert new employees if they don’t exist.  

-- 📊 Sample Tables
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2),
    DeptID INT
);

CREATE TABLE Updates (
    EmpID INT,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2),
    DeptID INT
);

-- 📝 Sample Data
-- Employees
| EmpID | EmpName | Salary | DeptID |
|-------|----------|--------|--------|
| 101 | Alice | 50000 | 2 |
| 102 | Bob | 45000 | 1 |

-- Updates
| EmpID | EmpName | Salary | DeptID |
|-------|-----------|--------|--------|
| 102 | Bob | 48000 | 1 |
| 103 | Charlie | 60000 | 2 |

*/

-- 💡 Solution
MERGE INTO Employees E
USING Updates U
ON E.EmpID = U.EmpID
WHEN MATCHED THEN
    UPDATE SET E.Salary = U.Salary, E.EmpName = U.EmpName, E.DeptID = U.DeptID
WHEN NOT MATCHED THEN
    INSERT (EmpID, EmpName, Salary, DeptID)
    VALUES (U.EmpID, U.EmpName, U.Salary, U.DeptID);

/*
-- 📝 Result (Employees after MERGE)
| EmpID | EmpName | Salary | DeptID |
|-------|----------|--------|--------|
| 101 | Alice | 50000 | 2 |
| 102 | Bob | 48000 | 1 |
| 103 | Charlie | 60000 | 2 |

-- 🎉 Explanation
- `MERGE` compares `Employees` with `Updates`.  
- `WHEN MATCHED` → updates existing employees (Bob’s salary updated to 48000).  
- `WHEN NOT MATCHED` → inserts new employees (Charlie added).  
- This is perfect for **upserts** (update or insert in one operation 🔄).
*/
