/*
-- ❓ Question
Find the average grade for each course in 2024.  

-- 📊 Sample Table(s)
CREATE TABLE Courses (
    CourseID INT,
    CourseName VARCHAR(100)
);

CREATE TABLE Grades (
    GradeID INT,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5,2),
    GradeDate DATE
);

-- 📝 Sample Data (only small input example, not inserts)
| CourseID | CourseName |
|----------|--------------|
| 1 | Math |
| 2 | Science |
| 3 | Literature |

| GradeID | StudentID | CourseID | Grade | GradeDate |
|---------|-----------|----------|-------|------------|
| 101 | 1 | 1 | 85.0 | 2024-01-15 |
| 102 | 2 | 1 | 90.0 | 2024-02-10 |
| 103 | 3 | 2 | 78.0 | 2024-03-12 |
| 104 | 1 | 3 | 88.0 | 2024-04-05 |
| 105 | 2 | 2 | 92.0 | 2024-04-22 |

*/

-- 💡 Solution
SELECT c.CourseID, c.CourseName,
       AVG(g.Grade) AS AvgGrade
FROM Courses c
JOIN Grades g ON c.CourseID = g.CourseID
WHERE EXTRACT(YEAR FROM g.GradeDate) = 2024
GROUP BY c.CourseID, c.CourseName
ORDER BY AvgGrade DESC;

/*
-- 🎉 Explanation
We join Courses with Grades, filter to 2024 results,  
then use `AVG` to compute the average grade per course.  
This helps teachers see which subjects students are excelling in 📖✨.  
*/
