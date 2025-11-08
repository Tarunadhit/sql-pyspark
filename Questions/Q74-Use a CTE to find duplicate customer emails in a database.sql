/*
-- ❓ Question
Use a CTE to find duplicate customer emails in a database.

-- 📊 Sample Table(s)
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);

-- 📝 Sample Data
| CustomerID | CustomerName | Email               |
|-------------|---------------|--------------------|
| 1           | Arjun         | arjun@mail.com     |
| 2           | Priya         | priya@mail.com     |
| 3           | Kiran         | arjun@mail.com     |
| 4           | Meena         | meena@mail.com     |
| 5           | Ravi          | priya@mail.com     |
*/
-- 💡 Solution
WITH EmailCounts AS (
    SELECT 
        Email,
        COUNT(*) AS EmailCount
    FROM Customers
    GROUP BY Email
)
SELECT 
    c.CustomerName,
    c.Email
FROM Customers c
JOIN EmailCounts ec ON c.Email = ec.Email
WHERE ec.EmailCount > 1
ORDER BY c.Email;
/*
-- 🎉 Explanation
First, the **CTE (`EmailCounts`)** groups emails and counts how many times they appear.  
Then we filter where `EmailCount > 1` to get customers sharing the same email.  
✅ CTEs help structure multi-step logic — great for **data quality checks** and **cleaning duplicates** 🧹.
*/
