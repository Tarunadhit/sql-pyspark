/*
-- ❓ Question
Find the course with the highest number of enrolled students.  

-- 📊 Sample Table(s)
CREATE TABLE Courses (
    CourseID INT,
    CourseName VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT
);

-- 📝 Sample Data
| CourseID | CourseName |
|----------|--------------|
| 1 | Math |
| 2 | Science |
| 3 | Literature |

| EnrollmentID | StudentID | CourseID |
|--------------|-----------|----------|
| 101 | 1 | 1 |
| 102 | 2 | 1 |
| 103 | 3 | 2 |
| 104 | 4 | 1 |
| 105 | 5 | 3 |

*/
-- 💡 Solution
SELECT c.CourseID, c.CourseName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY StudentCount DESC
LIMIT 1;

/*
-- 🎉 Explanation
We count distinct students per course using `COUNT(DISTINCT ...)`.  
Then, sorting by `StudentCount DESC` shows the most popular course.  
*/
`LIMIT 1` ensures we only return the single course with the max enrollments 🎯.  
