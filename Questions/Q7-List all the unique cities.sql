/* 
-- ❓ Question
List all the unique cities where customers live.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

-- 📝 Sample Data (only small input example, not inserts)
| CustomerID | CustomerName | City |
|------------|--------------|------------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | New York |
| 4 | Diana | Houston |

*/
-- 💡 Solution
SELECT DISTINCT City
FROM Customers;

/* 
-- 🎉 Explanation
The `DISTINCT` keyword removes duplicates like magic!  
Even if multiple customers live in the same city, each city will only appear once in the result.  
*/
