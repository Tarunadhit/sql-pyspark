/*
-- ❓ Question
Find students who enrolled in courses but never received a grade.  

-- 📊 Sample Table(s)
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT
);

CREATE TABLE Grades (
    GradeID INT,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5,2)
);

-- 📝 Sample Data
| StudentID | Name |
|-----------|----------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

| EnrollmentID | StudentID | CourseID |
|--------------|-----------|----------|
| 101 | 1 | C1 |
| 102 | 2 | C1 |
| 103 | 3 | C2 |

| GradeID | StudentID | CourseID | Grade |
|---------|-----------|----------|-------|
| 201 | 1 | C1 | 85.0 |

*/

-- 💡 Solution
SELECT s.StudentID, s.Name
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Grades g ON e.StudentID = g.StudentID AND e.CourseID = g.CourseID
WHERE g.GradeID IS NULL;

/*
-- 🎉 Explanation
We join students with their enrollments,  
then use a `LEFT JOIN` with grades to see who never got one.  
The `WHERE g.GradeID IS NULL` filters out graded students,  
leaving only those waiting for their results 📑.  
*/
