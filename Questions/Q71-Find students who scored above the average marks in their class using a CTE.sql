/*
-- ❓ Question
Find students who scored above the average marks in their class using a CTE.

-- 📊 Sample Table(s)
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(100),
    Class VARCHAR(50),
    Marks INT
);

-- 📝 Sample Data
| StudentID | StudentName | Class | Marks |
|------------|-------------|-------|-------|
| 1          | Arjun       | A     | 85    |
| 2          | Priya       | A     | 70    |
| 3          | Kiran       | A     | 90    |
| 4          | Meena       | B     | 75    |
| 5          | Ravi        | B     | 60    |
| 6          | Divya       | B     | 80    |
*/
-- 💡 Solution
WITH ClassAverage AS (
    SELECT 
        Class,
        AVG(Marks) AS AvgMarks
    FROM Students
    GROUP BY Class
)
SELECT 
    s.StudentName,
    s.Class,
    s.Marks
FROM Students s
JOIN ClassAverage ca ON s.Class = ca.Class
WHERE s.Marks > ca.AvgMarks;
/*
-- 🎉 Explanation
We first create a **CTE (`ClassAverage`)** to calculate each class’s average marks.  
Then, we join it back with the main table to find students who scored **above average** in their class.  
✅ CTEs make complex logic simple and readable — like breaking SQL into clear steps!
*/
