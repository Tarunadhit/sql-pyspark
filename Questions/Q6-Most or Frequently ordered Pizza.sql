/* 
🍕 SQL Puzzle of the Day  

❓ Question:  
Which pizzas are ordered more than 5 times in a single day?  
This helps us understand the demand for popular pizzas in the area.  

📥 Input Table: Orders  

+------------+------------+-------------+
| order_id | order_date | pizza_name |
+------------+------------+-------------+
| 1 | 2025-08-01 | Margherita |
| 2 | 2025-08-01 | Pepperoni |
| 3 | 2025-08-01 | Margherita |
| 4 | 2025-08-01 | Margherita |
| 5 | 2025-08-01 | Pepperoni |
| 6 | 2025-08-01 | Margherita |
| 7 | 2025-08-01 | Margherita |
| 8 | 2025-08-01 | Margherita |
| 9 | 2025-08-02 | BBQ Chicken |
| 10 | 2025-08-02 | BBQ Chicken |
| 11 | 2025-08-02 | BBQ Chicken |
| 12 | 2025-08-02 | Pepperoni |
+------------+------------+-------------+

📤 Expected Output:  

+------------+-------------+------------+
| order_date | pizza_name | total_orders |
+------------+-------------+------------+
| 2025-08-01 | Margherita | 6 |
+------------+-------------+------------+

💡 Explanation:  
On 2025-08-01, "Margherita" was ordered 6 times – more than 5!  
That’s our popular pizza of the day. 🍕🔥

This idea can be used in various business analytics to find the best selling product.

✅ SQL Solution:  
*/

SELECT 
    order_date, 
    pizza_name, 
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_date, pizza_name
HAVING COUNT(*) > 5;
