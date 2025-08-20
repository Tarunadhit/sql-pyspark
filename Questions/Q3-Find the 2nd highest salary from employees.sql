/*  
 🎯 DAILY SQL FUN – Q3  
 -------------------------------------------------
 Q1: Find the 2nd highest salary from employees.  
 -------------------------------------------------

💡 Logic in Simple Words:
Think of salaries like medals in a race:
🥇 Gold → Highest Salary  
🥈 Silver → 2nd Highest Salary  
🥉 Bronze → 3rd Highest, and so on...

We don’t want the gold here, we want the silver!  
That means: Skip the highest salary, then pick the next one.

🚀 Solution:
*/
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;

/*
✨ Breakdown:
1. ORDER BY salary DESC → arrange from biggest to smallest.  
2. OFFSET 1 → skip the 1st (gold medal salary).  
3. FETCH NEXT 1 → grab the very next one (silver salary).  

Boom! That’s your 2nd highest salary 🥈
*/
