/*
-- ❓ Question
What is a **deadlock** in SQL transactions?

-- 🧠 Options
A. When two transactions try to access the same table at the same time  
B. When two transactions wait indefinitely for each other’s locked resources  
C. When a transaction fails due to syntax errors  
D. When multiple users update different tables simultaneously  
*/
-- ✅ Correct Answer
B. When two transactions wait indefinitely for each other’s locked resources  
/*
-- 💡 Explanation
A **deadlock** occurs when:  
- Transaction 1 locks **Resource A** and waits for **Resource B**,  
- Transaction 2 locks **Resource B** and waits for **Resource A**,  
→ Both are **stuck forever** unless one transaction is rolled back by the database.  

💥 Example:
```sql
-- Txn 1
BEGIN;
UPDATE Accounts SET balance = balance - 100 WHERE id = 1;
UPDATE Accounts SET balance = balance + 100 WHERE id = 2;

-- Txn 2
BEGIN;
UPDATE Accounts SET balance = balance - 100 WHERE id = 2;
UPDATE Accounts SET balance = balance + 100 WHERE id = 1;
*/
