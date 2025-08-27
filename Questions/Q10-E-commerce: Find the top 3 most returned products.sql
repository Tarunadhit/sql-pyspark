/*
-- ❓ Question
E-commerce: Find the top 3 most returned products.  

-- 📊 Sample Table(s)
CREATE TABLE Returns (
    ReturnID INT,
    OrderID INT,
    ProductID INT,
    ReturnReason VARCHAR(255)
);


-- 📝 Sample Data (only small input example, not inserts)
| ReturnID | OrderID | ProductID | ReturnReason     |
|----------|---------|-----------|------------------|
| 1        | 101     | P1        | Damaged item     |
| 2        | 102     | P2        | Wrong size       |
| 3        | 103     | P1        | Defective        |
| 4        | 104     | P3        | Not as expected  |
| 5        | 105     | P1        | Broken on arrival|
| 6        | 106     | P2        | Color mismatch   |

*/

-- 💡 Solution
SELECT ProductID, COUNT(*) AS ReturnCount
FROM Returns
GROUP BY ProductID
ORDER BY ReturnCount DESC
LIMIT 3;

/*
-- 🎉 Explanation
We group returns by product, count how many times each was returned,  
and then sort in descending order to see the worst offenders.  
The `LIMIT 3` gives us the top 3 — because too many returns 🚨  
can be a red flag for product quality!  
*/
