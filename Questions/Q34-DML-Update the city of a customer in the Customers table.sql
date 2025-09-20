/*
-- ❓ Question
Update the city of a customer in the Customers table.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data (before update)
| CustomerID | Name | City |
|------------|---------|----------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | Boston |
*/
-- 💡 Solution
UPDATE Customers
SET City = 'San Francisco'
WHERE CustomerID = 2;
/*
-- 📝 Sample Data (after update)
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | San Francisco |
| 3 | Charlie | Boston |

-- 🎉 Explanation
The `UPDATE` command changes existing data.  
- `SET City = 'San Francisco'` → updates the value.  
- `WHERE CustomerID = 2` → ensures **only Bob’s row** is modified.  

Without the `WHERE`, all rows would get updated ⚠️!
*/
