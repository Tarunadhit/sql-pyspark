/*
-- ❓ Question
Prevent duplicate inserts in a concurrent transaction scenario using transaction control.

-- 📊 Sample Table(s)
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Email VARCHAR(100)
);

-- 📝 Sample Data
| UserID | UserName | Email               |
|---------|-----------|--------------------|
| 1       | Arjun     | arjun@email.com    |
| 2       | Meera     | meera@email.com    |

*/
-- 💡 Solution
-- 🧵 Session 1
BEGIN TRANSACTION;
SELECT * FROM Users WHERE Email = 'raj@email.com';  -- Check if user exists
-- Result: No user found

-- Insert new user
INSERT INTO Users (UserID, UserName, Email)
VALUES (3, 'Raj', 'raj@email.com');

-- Do not commit yet (simulating delay)

-- 🧵 Session 2 (runs before Session 1 commits)
BEGIN TRANSACTION;
SELECT * FROM Users WHERE Email = 'raj@email.com';  -- Still sees no record
-- Tries to insert same user
INSERT INTO Users (UserID, UserName, Email)
VALUES (4, 'Raj', 'raj@email.com');  -- ❌ Fails after commit due to unique constraint

COMMIT;

/*
-- ✅ Result
| UserID | UserName | Email               |
|---------|-----------|--------------------|
| 1       | Arjun     | arjun@email.com    |
| 2       | Meera     | meera@email.com    |
| 3       | Raj       | raj@email.com      |

-- 🎉 Explanation
- Both sessions check for an existing record **before** committing.  
- Only one insert succeeds due to **unique constraint on Email**.  
- Demonstrates **isolation** — each transaction sees its own state until committed.  
- Prevents race conditions in high-concurrency environments ⚙️.
*/
