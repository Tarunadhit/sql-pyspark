-- Question:
-- Get employees having more salary than their manager.

-- Input Tables:
-- Employees(employee_id, name, salary, manager_id)

-- Expected Output:
-- List of employee_id, name, and salary of employees whose salary > manager’s salary.

-- SQL Query:
SELECT e.employee_id,
       e.name,
       e.salary
FROM Employees e
JOIN Employees m
     ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- Sample Input:
-- employee_id | name | salary | manager_id
-- ------------+---------+--------+-----------
-- 1 | John | 5000 | 3
-- 2 | Alice | 7000 | 3
-- 3 | Bob | 6000 | NULL
-- 4 | Carol | 6500 | 2

-- Sample Output:
-- employee_id | name | salary
-- ------------+---------+--------
-- 2 | Alice | 7000
-- 4 | Carol | 6500
