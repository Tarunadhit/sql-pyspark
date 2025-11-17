/*
-- ❓ 
Use a CTE to calculate each product’s total sales, then use a second CTE to find products whose sales are above the average total sales.

-- 📊 Sample Table(s)
CREATE TABLE Sales (
    SaleID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    PricePerUnit DECIMAL(10,2)
);

-- 📝 Sample Data
| SaleID | ProductName | Quantity | PricePerUnit |
|--------|-------------|----------|---------------|
| 1      | Laptop      | 1        | 60000         |
| 2      | Mouse       | 2        | 500           |
| 3      | Laptop      | 1        | 60000         |
| 4      | Keyboard    | 1        | 2000          |
| 5      | Mouse       | 1        | 500           |
*/
-- 💡 Solution
WITH ProductTotals AS (
    SELECT 
        ProductName,
        SUM(Quantity * PricePerUnit) AS TotalSales
    FROM Sales
    GROUP BY ProductName
),
AvgSales AS (
    SELECT AVG(TotalSales) AS AvgTotalSales
    FROM ProductTotals
)
SELECT 
    pt.ProductName,
    pt.TotalSales
FROM ProductTotals pt
CROSS JOIN AvgSales a
WHERE pt.TotalSales > a.AvgTotalSales
ORDER BY pt.TotalSales DESC;
/*
-- 🎉 Explanation
1. **ProductTotals (CTE 1):**  
   - Computes total revenue per product.

2. **AvgSales (CTE 2):**  
   - Calculates the *average* total sales across all products.

3. **Final Query:**  
   - Returns only those products whose total sales exceed the average.  
   - This is a classic practical use of **multiple CTEs for multi-stage analytics**.

Perfect final question to complete the SQL series! ✔🔥
*/
