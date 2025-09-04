/*
Find the students who are enrolled in more than 2 courses.  

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

-- 📝 Sample Data 
| StudentID | Name |
|-----------|----------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

| EnrollmentID | StudentID | CourseID |
|--------------|-----------|----------|
| 101 | 1 | C1 |
| 102 | 1 | C2 |
| 103 | 1 | C3 |
| 104 | 2 | C1 |
| 105 | 2 | C2 |
| 106 | 3 | C1 |

*/

-- 💡 Solution
SELECT s.StudentID, s.Name,
       COUNT(e.CourseID) AS CourseCount
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name
HAVING COUNT(e.CourseID) > 2;

/*
-- 🎉 Explanation
We group enrollments by student and count their courses.  
The `HAVING` clause (like a `WHERE` for groups) ensures only students  
with more than 2 courses are shown.  
Perfect for spotting the super-active learners 📚✨.  
*/
