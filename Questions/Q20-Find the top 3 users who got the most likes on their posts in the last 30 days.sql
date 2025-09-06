/*
-- ❓ Question  
Find the top 3 users who got the **most likes** on their posts in the last 30 days.  

-- 📊 Sample Tables  
CREATE TABLE Users (
    UserID INT,
    UserName VARCHAR(50)
);

CREATE TABLE Posts (
    PostID INT,
    UserID INT,
    PostDate DATE
);

CREATE TABLE Likes (
    LikeID INT,
    PostID INT,
    LikeDate DATE
);

-- 📝 Sample Data
Users  
| UserID | UserName |  
|--------|------------|  
| 1 | Alice |  
| 2 | Bob |  
| 3 | Charlie |  

Posts  
| PostID | UserID | PostDate |  
|--------|--------|------------|  
| 10 | 1 | 2025-08-01 |  
| 11 | 2 | 2025-08-05 |  
| 12 | 3 | 2025-08-10 |  

Likes  
| LikeID | PostID | LikeDate |  
|--------|--------|------------|  
| 101 | 10 | 2025-08-15 |  
| 102 | 11 | 2025-08-18 |  
| 103 | 10 | 2025-08-20 |  
| 104 | 12 | 2025-08-21 |  
| 105 | 10 | 2025-08-22 |  

*/

-- 💡 Solution  
SELECT u.UserName, COUNT(l.LikeID) AS TotalLikes  
FROM Users u  
JOIN Posts p ON u.UserID = p.UserID  
JOIN Likes l ON p.PostID = l.PostID  
WHERE l.LikeDate >= DATEADD(DAY, -30, GETDATE())  
GROUP BY u.UserName  
ORDER BY TotalLikes DESC  
FETCH FIRST 3 ROWS ONLY;  

/*
-- 🎉 Explanation  
We count likes per user in the last 30 days,  
rank them, and fetch only the **top 3 influencers** 📈🔥.
*/
