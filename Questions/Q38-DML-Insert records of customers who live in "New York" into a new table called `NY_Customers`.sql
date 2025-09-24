/*
-- ❓ Question
Insert records of customers who live in "New York" into a new table called `NY_Customers`.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE NY_Customers (
    CustomerID INT,
    Name VARCHAR(100),
    City VARCHAR(50)
);

-- 📝 Sample Data
-- Customers
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | New York |
| 4 | David | Boston |

*/

-- 💡 Solution
INSERT INTO NY_Customers (CustomerID, Name, City)
SELECT CustomerID, Name, City
FROM Customers
WHERE City = 'New York';

/*

-- 📝 Sample Data (NY_Customers after insert)
| CustomerID | Name | City |
|------------|---------|----------|
| 1 | Alice | New York |
| 3 | Charlie | New York |

-- 🎉 Explanation
- `INSERT INTO … SELECT` copies matching rows from one table into another.  
- Here, we filtered only **New York customers** using the `WHERE` clause.  
- Useful for **archiving, backups, or creating subset tables**.

*/
