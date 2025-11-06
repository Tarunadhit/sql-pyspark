/*
-- ❓ Question
Using a recursive CTE, list all employees under each manager in the company hierarchy.

-- 📊 Sample Table(s)
CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(100),
    ManagerID INT
);

-- 📝 Sample Data
| EmpID | EmpName  | ManagerID |
|--------|-----------|-----------|
| 1      | Arjun     | NULL      |
| 2      | Priya     | 1         |
| 3      | Kiran     | 1         |
| 4      | Meena     | 2         |
| 5      | Ravi      | 2         |
| 6      | Divya     | 3         |
*/
-- 💡 Solution
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: top-level managers
    SELECT 
        EmpID,
        EmpName,
        ManagerID,
        EmpName AS HierarchyPath
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive step: find subordinates
    SELECT 
        e.EmpID,
        e.EmpName,
        e.ManagerID,
        CONCAT(eh.HierarchyPath, ' > ', e.EmpName) AS HierarchyPath
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmpID
)
SELECT * 
FROM EmployeeHierarchy
ORDER BY HierarchyPath;
/*
-- 🎉 Explanation
We start with the **top-level managers** (where `ManagerID IS NULL`),  
then recursively join to find all subordinates below them.  

Each step builds a **path** showing who reports to whom — like a company tree 🌳.  
✅ Recursive CTEs are ideal for **organizational charts**, **folder structures**, or **nested comments**!
*/
