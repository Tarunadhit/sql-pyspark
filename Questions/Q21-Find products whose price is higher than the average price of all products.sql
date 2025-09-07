/*
-- ❓ Question
Find products whose price is higher than the average price of all products.  

-- 📊 Sample Table(s)
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 📝 Sample Data
| ProductID | ProductName | Price |
|-----------|-------------|-------|
| 1 | Laptop | 1000 |
| 2 | Keyboard | 50 |
| 3 | Monitor | 300 |
| 4 | Mouse | 25 |
| 5 | Tablet | 600 |

*/

-- 💡 Solution
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price) FROM Products
);

/*
-- 🎉 Explanation
We calculate the **average price** in a subquery,  
then filter products whose price is above that average.  
This is like finding the **premium items 💎** in the catalog.
*/
