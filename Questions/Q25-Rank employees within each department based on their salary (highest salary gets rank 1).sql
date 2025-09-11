/*
-- ❓ Question
Rank employees within each department based on their salary (highest salary gets rank 1).  

-- 📊 Sample Table(s)
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

-- 📝 Sample Data (only small input example, not inserts)
| EmployeeID | EmployeeName | DepartmentID | Salary |
|------------|--------------|--------------|--------|
| 1 | Alice | 10 | 60000 |
| 2 | Bob | 10 | 55000 |
| 3 | Charlie | 20 | 70000 |
| 4 | David | 20 | 72000 |
| 5 | Emma | 10 | 80000 |

*/

-- 💡 Solution
SELECT 
    EmployeeID,
    EmployeeName,
    DepartmentID,
    Salary,
    RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

/*

-- 🎉 Explanation
We use the **RANK() window function** to assign ranks  
based on salary, but separately for each department using `PARTITION BY`.  
This way, every department gets its own ranking ladder 🏆.
*/
