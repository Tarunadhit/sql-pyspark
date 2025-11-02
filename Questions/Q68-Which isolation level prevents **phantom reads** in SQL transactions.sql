/*
-- ❓ Question
Which isolation level prevents **phantom reads** in SQL transactions?

-- 🧠 Options
A. READ COMMITTED  
B. REPEATABLE READ  
C. SERIALIZABLE  
D. READ UNCOMMITTED  
*/
-- ✅ Correct Answer
C. SERIALIZABLE  
/*
-- 💡 Explanation
- **Phantom read** occurs when a transaction re-executes a query and finds **new rows** inserted by another transaction.  
- Example:  
  - Txn 1 runs `SELECT * FROM Employees WHERE salary > 50000` and gets 5 rows.  
  - Txn 2 inserts a new employee with salary 60000 and commits.  
  - Txn 1 runs the same query again → now 6 rows appear (a *phantom* row 👻).  

Only **SERIALIZABLE** isolation level prevents this by locking the range of data accessed, ensuring no new rows appear between reads.  

| Isolation Level   | Phantom Reads |  
|-------------------|----------------|  
*/
| READ UNCOMMITTED  | ✅ Allowed     |  
| READ COMMITTED    | ✅ Allowed     |  
| REPEATABLE READ   | ✅ Allowed     |  
| SERIALIZABLE      | ❌ Prevented   |  
