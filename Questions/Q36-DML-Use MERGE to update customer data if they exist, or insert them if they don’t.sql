/*
-- ❓ Question
Use MERGE to update customer data if they exist, or insert them if they don’t.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE NewData (
    CustomerID INT,
    Name VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data
-- Customers (before merge)
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | San Francisco |

-- NewData
| CustomerID | Name | City |
|------------|---------|----------|
| 2 | Bob | Chicago |
| 3 | Charlie | Boston |

*/

-- 💡 Solution
MERGE INTO Customers c
USING NewData n
ON c.CustomerID = n.CustomerID
WHEN MATCHED THEN 
    UPDATE SET c.Name = n.Name, c.City = n.City
WHEN NOT MATCHED THEN 
    INSERT (CustomerID, Name, City)
    VALUES (n.CustomerID, n.Name, n.City);

/*

-- 📝 Sample Data (after merge)
| CustomerID | Name | City |
|------------|---------|----------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | Boston |

-- 🎉 Explanation
- `MERGE` compares target (`Customers`) with source (`NewData`).  
- `WHEN MATCHED` → updates Bob’s city to Chicago.  
- `WHEN NOT MATCHED` → inserts Charlie as a new customer.  
This makes `MERGE` perfect for **upserts** (update + insert in one go).
*/
