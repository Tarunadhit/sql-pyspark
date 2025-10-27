/*
-- ❓ Question
Insert data into multiple related tables in a single transaction.  
If any step fails, roll back the entire operation.

-- 📊 Sample Table(s)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(20)
);

-- 📝 Sample Data
| Orders |                | Payments |              |
|---------|----------------|-----------|--------------|
| OrderID | CustomerName   | TotalAmt  | PaymentID | OrderID | Amount | PaymentStatus |
|---------|----------------|-----------|-----------|---------|--------|---------------|
| 1       | Asha           | 1200.00   | —         | —       | —      | —             |
*/
-- 💡 Solution
BEGIN TRANSACTION;

INSERT INTO Orders (OrderID, CustomerName, TotalAmount)
VALUES (2, 'Rohan', 1500.00);

-- ❌ Intentional error: Payment amount mismatch (too high)
INSERT INTO Payments (PaymentID, OrderID, Amount, PaymentStatus)
VALUES (201, 2, 2000.00, 'Pending');

-- Validation check
IF (SELECT TotalAmount FROM Orders WHERE OrderID = 2) <> 
   (SELECT Amount FROM Payments WHERE OrderID = 2)
BEGIN
    PRINT 'Error: Payment amount mismatch. Rolling back!';
    ROLLBACK;
END
ELSE
    COMMIT;

SELECT * FROM Orders;
SELECT * FROM Payments;
/*
-- ✅ Result
| OrderID | CustomerName | TotalAmount |
|----------|---------------|-------------|
| 1        | Asha          | 1200.00     |

| PaymentID | OrderID | Amount | PaymentStatus |
|------------|----------|--------|---------------|
| (no new rows inserted due to rollback) |

-- 🎉 Explanation
- Both inserts are treated as **one logical unit**.
- When a mismatch is detected, the entire transaction is **rolled back**.
- Ensures **Consistency** and **Atomicity** — either all records are saved or none 💾.
*/
