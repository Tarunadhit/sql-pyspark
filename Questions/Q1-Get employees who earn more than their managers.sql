/*  
 🎯 DAILY SQL – Q1  
 -------------------------------------------------
 Q1: Get employees who earn more than their managers.  
 -------------------------------------------------

💡 Logic in Simple Words:
It’s like a plot twist in an office movie 🎬 —  
Imagine an employee telling their manager:  
“Hey boss, I actually earn more than you 😏.”

We want to find all those cheeky employees!

🚀 Solution:
*/
SELECT e.employee_id, e.name AS employee_name, e.salary AS employee_salary,
       m.name AS manager_name, m.salary AS manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

/*
✨ Breakdown:
1. We join employees with the same table (self-join) → so every employee is matched with their manager.  
2. WHERE e.salary > m.salary → filter only where the employee earns more than the manager.  

Fun twist: This query exposes the “secret rebels” in the office earning higher than their managers 😅.
*/
