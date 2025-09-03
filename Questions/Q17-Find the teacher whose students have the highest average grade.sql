/*
-- ❓ Question
Find the teacher whose students have the highest average grade.  

-- 📊 Sample Table(s)
CREATE TABLE Teachers (
    TeacherID INT,
    TeacherName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT,
    CourseName VARCHAR(100),
    TeacherID INT
);

CREATE TABLE Grades (
    GradeID INT,
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5,2)
);

-- 📝 Sample Data (only small input example, not inserts)
| TeacherID | TeacherName |
|-----------|-------------|
| 1 | Mr. Smith |
| 2 | Ms. Johnson |

| CourseID | CourseName | TeacherID |
|----------|------------|-----------|
| 101 | Math | 1 |
| 102 | Science | 1 |
| 103 | History | 2 |

| GradeID | StudentID | CourseID | Grade |
|---------|-----------|----------|-------|
| 201 | 1 | 101 | 85.0 |
| 202 | 2 | 101 | 90.0 |
| 203 | 3 | 102 | 88.0 |
| 204 | 4 | 103 | 70.0 |
| 205 | 5 | 103 | 75.0 |

*/

-- 💡 Solution
SELECT t.TeacherID, t.TeacherName,
       AVG(g.Grade) AS AvgGrade
FROM Teachers t
JOIN Courses c ON t.TeacherID = c.TeacherID
JOIN Grades g ON c.CourseID = g.CourseID
GROUP BY t.TeacherID, t.TeacherName
ORDER BY AvgGrade DESC
LIMIT 1;

/*

-- 🎉 Explanation
We connect teachers → courses → grades,  
then calculate each teacher’s students’ average grades. 
Sorting by `AvgGrade DESC` gives us the best-performing teacher 👩‍🏫🏆.  

*/
