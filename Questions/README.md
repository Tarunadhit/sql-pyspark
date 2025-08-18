# ❓ Daily SQL Questions & Answers  

Welcome to my **Daily Question Bank** 📘 where I solve one SQL question every day.  
This folder is a collection of **real-world SQL problems** with **inputs, queries, and outputs** clearly explained.  

---

## 📂 What’s Inside?
Each file follows this format:
- **Question** – A well-defined SQL problem.  
- **Input** – Sample dataset to understand the context.  
- **Query** – The SQL solution I wrote.  
- **Output** – Expected result for validation.  

---

## 🚀 Why This Repo?
- Practice SQL daily to sharpen problem-solving skills  
- Build consistency through structured Q&A format  
- Share knowledge with others learning SQL  

---

## 🗂 Example Format
```sql
-- Question: Find the second highest salary from the Employees table.  

-- Input:
-- EmployeeID | Name | Salary
-- -----------|--------|--------
-- 1 | Alex | 60000
-- 2 | Maria | 75000
-- 3 | John | 50000
-- 4 | David | 80000

-- Query:
SELECT Salary 
FROM Employees e1
WHERE 2 = (
    SELECT COUNT(DISTINCT Salary)
    FROM Employees e2
    WHERE e2.Salary >= e1.Salary
);

-- Output:
-- 75000
