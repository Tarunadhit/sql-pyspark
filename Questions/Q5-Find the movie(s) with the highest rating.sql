/* 
🍿 Question of the Day 🍿
Find the movie(s) with the highest rating from the "Movies" table.  

🎬 Table: Movies  
+------------+---------------+--------+
| movie_id | title | rating |
+------------+---------------+--------+
| 1 | Inception | 9.0 |
| 2 | Interstellar | 8.6 |
| 3 | Tenet | 7.5 |
| 4 | Dark Knight | 9.0 |
| 5 | Dunkirk | 7.9 |
+------------+---------------+--------+

✨ Your task: Return only the movie(s) that have the highest rating.
*/

/* 
🚀 Answer:
Step 1: Find the highest rating.  
Step 2: Select all movies with that rating.  
*/

SELECT title, rating
FROM Movies
WHERE rating = (SELECT MAX(rating) FROM Movies);

-- 🎉 Output:
-- +---------------+--------+
-- | title | rating |
-- +---------------+--------+
-- | Inception | 9.0 |
-- | Dark Knight | 9.0 |
-- +---------------+--------+

/*
💡 Explanation:
1️⃣ MAX(rating) finds the top rating (here 9.0).  
2️⃣ Then we only keep movies whose rating equals that maximum.  
👉 Boom! You get all the chartbusters. 🍿🔥
*/
