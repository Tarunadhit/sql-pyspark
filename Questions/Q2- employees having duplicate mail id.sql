-- 🎯 Today's Fun SQL Challenge:
-- Find the email IDs that appear more than once in the Employee table.

-- 👩‍💻 Table: Employee
-- Columns: Id (INT), Email (VARCHAR)

-- 🧠 Logic:
-- If the same email is used by multiple employees, it means it's duplicated.
-- We'll group all emails together and then count them.
-- Any email having COUNT > 1 is a duplicate. Easy-peasy!

SELECT 
    Email
FROM 
    Employee
GROUP BY 
    Email
HAVING 
    COUNT(Email) > 1;

-- ✅ Output: Only the email IDs that are repeated will be shown.
-- Example:
-- If the table has:
-- 1 | a@example.com
-- 2 | b@example.com
-- 3 | a@example.com
-- 4 | c@example.com
-- 5 | b@example.com
--
-- The result will be:
-- a@example.com
-- b@example.com

-- 🎉 Fun Tip:
-- Think of it like spotting people wearing the SAME T-SHIRT at a party 🥳
-- If more than one person wears the same design, that t-shirt (email) is duplicated!
