/*
-- ❓ Question
Find students who scored higher than the average marks in their class.  

-- 📊 Sample Table(s)
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(100),
    ClassID INT,
    Marks INT
);

-- 📝 Sample Data
| StudentID | StudentName | ClassID | Marks |
|-----------|-------------|---------|-------|
| 1 | Alice | 101 | 85 |
| 2 | Bob | 101 | 60 |
| 3 | Charlie | 101 | 75 |
| 4 | David | 102 | 90 |
| 5 | Emma | 102 | 70 |

*/

-- 💡 Solution
SELECT StudentID, StudentName, Marks
FROM Students s
WHERE Marks > (
    SELECT AVG(Marks) 
    FROM Students 
    WHERE ClassID = s.ClassID
);

/*
-- 🎉 Explanation
We use a **correlated subquery** that calculates the  
average marks per class, then compare each student’s marks  
to their class average. 🎓  
This helps spot the **above-average performers** in each class.
*/
