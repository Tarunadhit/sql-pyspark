/*
-- ❓ Question
Find the top 2 products by sales amount in each category using a CTE.

-- 📊 Sample Table(s)
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SalesAmount DECIMAL(10,2)
);

-- 📝 Sample Data
| ProductID | ProductName | Category | SalesAmount |
|------------|--------------|-----------|--------------|
| 1          | Laptop       | Electronics | 50000 |
| 2          | Headphones   | Electronics | 15000 |
| 3          | Keyboard     | Electronics | 8000  |
| 4          | Sofa         | Furniture   | 30000 |
| 5          | Table        | Furniture   | 20000 |
| 6          | Chair        | Furniture   | 15000 |
*/
-- 💡 Solution
WITH RankedProducts AS (
    SELECT 
        ProductID,
        ProductName,
        Category,
        SalesAmount,
        RANK() OVER (PARTITION BY Category ORDER BY SalesAmount DESC) AS rnk
    FROM Products
)
SELECT 
    ProductName,
    Category,
    SalesAmount
FROM RankedProducts
WHERE rnk <= 2
ORDER BY Category, SalesAmount DESC;
/*
-- 🎉 Explanation
We use a **CTE (`RankedProducts`)** to assign a rank to each product within its category  
based on `SalesAmount`.  
Then, we simply pick those ranked **1 or 2** → the **top 2 sellers** per category!  

💡 This combo of **CTE + window function** is perfect for leaderboard-style problems 🏆.
*/
