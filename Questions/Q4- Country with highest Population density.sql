/* 
🎯 Today's Fun SQL Question:
--------------------------------
We all know some countries have HUGE populations 
and some have HUGE areas. 
But the real question is: 
👉 Which country is PACKED the most (population density)?

💡 Formula for Population Density:
    population_density = population / area 

So, the country with the highest ratio is basically the one 
where you’d feel like standing in a *crowded metro train* 😅
*/

/* 
✅ Logic:
1. We take the `population` and `area` of each country.
2. We divide population by area → gives density.
3. We then find which country has the highest density.
   (Think: “most people per square km”).
*/

/* 
🔥 SQL Query:
*/
SELECT 
    country_name,
    population,
    area,
    (population / area) AS population_density
FROM countries
ORDER BY population_density DESC
LIMIT 1;

/* 
🚀 Fun Explanation:
This query shows us the country where you’d 
have to *fight for elbow room*. 
For example, countries like Singapore or Bangladesh 
often pop up with high density!  

So the result? 
The most "crowded country champion" 🏆
*/
