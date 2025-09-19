/*
-- ❓ Question
Insert a new customer into the Customers table.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data (before insert)
| CustomerID | Name | City |
|------------|---------|----------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |

*/
-- 💡 Solution
INSERT INTO Customers (CustomerID, Name, City)
VALUES (3, 'Charlie', 'Boston');

/*

-- 📝 Sample Data (after insert)
| CustomerID | Name | City |
|------------|---------|----------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | Boston |

-- 🎉 Explanation
The `INSERT INTO` statement adds a **new row** into the table.  
We specify **columns** (`CustomerID, Name, City`) and their **values**.  
This grows the table with fresh data 📥.

*/
