/*
-- ❓ Question
Find the top 3 students who enrolled in the most courses.  

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

-- 📝 Sample Data (only small input example, not inserts)
| StudentID | Name |
|-----------|----------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |
| 4 | Diana |

| EnrollmentID | StudentID | CourseID |
|--------------|-----------|----------|
| 101 | 1 | C1 |
| 102 | 1 | C2 |
| 103 | 2 | C1 |
| 104 | 2 | C3 |
| 105 | 2 | C4 |
| 106 | 3 | C2 |

*/

-- 💡 Solution
SELECT s.StudentID, s.Name,
       COUNT(e.CourseID) AS CourseCount
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
ORDER BY CourseCount DESC
LIMIT 3;

/*
-- 🎉 Explanation
We join Students with Enrollments, count how many courses each student took,  
then sort by course count. The `LIMIT 3` gives us the top learners 📚!  

*/
