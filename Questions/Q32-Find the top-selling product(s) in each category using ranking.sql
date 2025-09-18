/*
-- ❓ Question
Find the top-selling product(s) in each category using ranking.  

-- 📊 Sample Table(s)
CREATE TABLE Products (
    ProductID INT,
    CategoryID INT,
    ProductName VARCHAR(100),
    Sales INT
);

-- 📝 Sample Data
| ProductID | CategoryID | ProductName | Sales |
|-----------|------------|-------------|-------|
| 1 | 10 | Shoes | 500 |
| 2 | 10 | Sandals | 300 |
| 3 | 10 | Boots | 700 |
| 4 | 20 | Laptop | 1000 |
| 5 | 20 | Mouse | 400 |
| 6 | 20 | Keyboard | 600 |

*/
-- 💡 Solution
SELECT 
    CategoryID,
    ProductName,
    Sales,
    RANK() OVER (
        PARTITION BY CategoryID 
        ORDER BY Sales DESC
    ) AS SalesRank
FROM Products
WHERE RANK() OVER (
        PARTITION BY CategoryID 
        ORDER BY Sales DESC
    ) = 1;
/*
-- 🎉 Explanation
- `RANK()` assigns rank **within each category**.  
- `PARTITION BY CategoryID` makes the ranking restart for every category.  
- `ORDER BY Sales DESC` ranks products by sales (highest = rank 1).  
- Filtering for `= 1` gives us the **top-seller(s)** in each category.  

This way, we can easily see the **best-performing product 🏆 in every category**.
*/
