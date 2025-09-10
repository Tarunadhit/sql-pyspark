/*
-- ❓ Question
Find users who have created more posts than the average number of posts across all users.  

-- 📊 Sample Table(s)
CREATE TABLE Users (
    UserID INT,
    UserName VARCHAR(100)
);

CREATE TABLE Posts (
    PostID INT,
    UserID INT,
    Content VARCHAR(255)
);

-- 📝 Sample Data 
| UserID | UserName |
|--------|-----------|
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

| PostID | UserID | Content |
|--------|--------|---------------|
| 101 | 1 | "Hello world" |
| 102 | 1 | "SQL is fun" |
| 103 | 2 | "Good morning"|
| 104 | 3 | "Weekend!" |
| 105 | 3 | "Party time" |
| 106 | 3 | "SQL rocks" |

*/

-- 💡 Solution
SELECT u.UserID, u.UserName
FROM Users u
WHERE (
    SELECT COUNT(*) 
    FROM Posts p 
    WHERE p.UserID = u.UserID
) > (
    SELECT AVG(PostCount)
    FROM (
        SELECT COUNT(*) AS PostCount
        FROM Posts
        GROUP BY UserID
    ) sub
);

/*
-- 🎉 Explanation
First, we count how many posts each user has.  
Then, we compare it against the **average number of posts**  
calculated from all users.  
This highlights the **super active users 📱🔥** in the community.
*/
