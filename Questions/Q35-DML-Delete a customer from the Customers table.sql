/*
-- ❓ Question
Delete a customer from the Customers table.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data (before delete)
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | San Francisco |
| 3 | Charlie | Boston |

*/

-- 💡 Solution
DELETE FROM Customers
WHERE CustomerID = 3;
/*
-- 📝 Sample Data (after delete)
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | San Francisco |

-- 🎉 Explanation
The `DELETE` command removes rows.  
- `WHERE CustomerID = 3` → ensures only **Charlie’s row** is deleted.  
⚠️ If you skip the `WHERE`, the entire table will be cleared out!
*/
