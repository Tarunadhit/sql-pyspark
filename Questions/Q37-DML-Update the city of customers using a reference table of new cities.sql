/*
-- ❓ Question
Update the city of customers using a reference table of new cities.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE NewCities (
    CustomerID INT,
    NewCity VARCHAR(50)
);

-- 📝 Sample Data
-- Customers
| CustomerID | Name | City |
|------------|---------|----------------|
| 1 | Alice | New York |
| 2 | Bob | San Francisco |
| 3 | Charlie | Boston |

-- NewCities
| CustomerID | NewCity |
|------------|----------------|
| 2 | Chicago |
| 3 | San Diego |

*/

-- 💡 Solution
UPDATE Customers c
SET City = (SELECT n.NewCity FROM NewCities n WHERE n.CustomerID = c.CustomerID)
WHERE CustomerID IN (SELECT CustomerID FROM NewCities);

/*

-- 📝 Sample Data (after update)
| CustomerID | Name | City |
|------------|---------|-------------|
| 1 | Alice | New York |
| 2 | Bob | Chicago |
| 3 | Charlie | San Diego |

-- 🎉 Explanation
- `UPDATE` with a **subquery** fetches the new city from `NewCities`.  
- `WHERE CustomerID IN (SELECT ...)` ensures only customers with updates are modified.  
- This is a practical way to **sync tables or update from reference data 🔄**.
*/
