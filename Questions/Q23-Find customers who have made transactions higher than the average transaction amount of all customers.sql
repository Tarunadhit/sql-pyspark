/*
-- ❓ Question
Find customers who have made transactions higher than the average transaction amount of all customers.  

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(100)
);

CREATE TABLE Transactions (
    TransactionID INT,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

-- 📝 Sample Data (only small input example, not inserts)
| CustomerID | CustomerName |
|------------|--------------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

| TransactionID | CustomerID | Amount |
|---------------|------------|--------|
| 101 | 1 | 500 |
| 102 | 2 | 200 |
| 103 | 3 | 800 |
| 104 | 1 | 700 |
| 105 | 2 | 100 |

*/

-- 💡 Solution
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c
JOIN Transactions t ON c.CustomerID = t.CustomerID
WHERE t.Amount > (
    SELECT AVG(Amount) FROM Transactions
);

/*
-- 🎉 Explanation
The subquery finds the **overall average transaction amount**.  
We then filter customers who made at least one transaction  
greater than this average 💳.  
It’s a neat way to find **big spenders 💰**.
*/
