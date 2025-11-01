/*
-- ❓ Question
Which isolation level prevents **dirty reads** but still allows **non-repeatable reads** in SQL?

-- 🧠 Options
A. READ UNCOMMITTED  
B. READ COMMITTED  
C. REPEATABLE READ  
D. SERIALIZABLE  
*/
-- ✅ Correct Answer
B. READ COMMITTED  
/*
-- 🧩 Explanation
- **READ UNCOMMITTED** → Allows dirty reads (can read uncommitted data).  
- **READ COMMITTED** → Prevents dirty reads (only reads committed data), but **non-repeatable reads** can still occur.  
- **REPEATABLE READ** → Prevents dirty and non-repeatable reads, but **phantom reads** can occur.  
- **SERIALIZABLE** → Prevents all anomalies (most strict and slowest).  

-- 📘 Summary Table

| Isolation Level   | Dirty Read | Non-Repeatable Read | Phantom Read |
|-------------------|-------------|---------------------|---------------|
| Read Uncommitted  | ✅ Allowed  | ✅ Allowed          | ✅ Allowed    |
| Read Committed    | ❌ Prevented| ✅ Allowed          | ✅ Allowed    |
| Repeatable Read   | ❌ Prevented| ❌ Prevented        | ✅ Allowed    |
| Serializable      | ❌ Prevented| ❌ Prevented        | ❌ Prevented  |
*/
