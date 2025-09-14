/*
-- ❓ Question
Find the top 2 highest-paid employees in each department (including ties).  

-- 📊 Sample Table(s)
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2)
);

-- 📝 Sample Data
| EmployeeID | EmployeeName | DepartmentID | Salary |
|------------|--------------|--------------|--------|
| 1 | Alice | 10 | 90000 |
| 2 | Bob | 10 | 85000 |
| 3 | Charlie | 10 | 85000 |
| 4 | David | 20 | 95000 |
| 5 | Emma | 20 | 87000 |
| 6 | Frank | 20 | 86000 |

*/

-- 💡 Solution
SELECT EmployeeID, EmployeeName, DepartmentID, Salary
FROM (
    SELECT 
        EmployeeID,
        EmployeeName,
        DepartmentID,
        Salary,
        DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS rnk
    FROM Employees
) sub
WHERE rnk <= 2;

/*

-- 🎉 Explanation
We use `DENSE_RANK()` to rank employees by salary within each department.  
Unlike `ROW_NUMBER`, it handles ties properly 👥.  
Filtering `rnk <= 2` gives us the **top 2 salary levels** per department 🏆.

*/
