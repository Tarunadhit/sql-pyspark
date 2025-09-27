/*
-- ❓ Question
Increase the salary of employees by 10% if they belong to the "IT" department.

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
UPDATE E
SET E.Salary = E.Salary * 1.10
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'IT';

/*
-- ✅ Result (Employees after update)
| EmpID | EmpName | Salary | DeptID |
|-------|----------|--------|--------|
| 101 | Alice | 55000 | 2 |
| 102 | Bob | 45000 | 1 |
| 103 | Charlie | 66000 | 2 |
| 104 | David | 55000 | 3 |

-- 🎉 Explanation
- We joined Employees with Departments.
- Only employees in the "IT" department got their salary increased by 10%.
*/
