/*
-- ❓ Question
Delete all employees who belong to the "HR" department.

-- 📊 Sample Tables
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2),
    DeptID INT
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- 📝 Sample Data
-- Departments
| DeptID | DeptName |
|--------|------------|
| 1 | HR |
| 2 | IT |
| 3 | Finance |

-- Employees
| EmpID | EmpName | Salary | DeptID |
|-------|----------|--------|--------|
| 101 | Alice | 50000 | 2 |
| 102 | Bob | 45000 | 1 |
| 103 | Charlie | 60000 | 2 |
| 104 | David | 55000 | 3 |

*/

-- 💡 Query
DELETE E
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'HR';

/*
-- ✅ Result (Employees after delete)
| EmpID | EmpName | Salary | DeptID |
|-------|----------|--------|--------|
| 101 | Alice | 50000 | 2 |
| 103 | Charlie | 60000 | 2 |
| 104 | David | 55000 | 3 |

-- 🎉 Explanation
- We performed a `DELETE` with a `JOIN`.
- All employees in the HR department (DeptID = 1) are removed from the Employees table.
*/
