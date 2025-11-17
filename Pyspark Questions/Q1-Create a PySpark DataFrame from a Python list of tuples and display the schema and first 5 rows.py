# ❓ Question 1
Create a PySpark DataFrame from a Python list of tuples and display the schema and first 5 rows.

# 📝 Input Data (Python List)
data = [
    (1, "Tarun", 24),
    (2, "Anita", 22),
    (3, "Rahul", 25)
]

columns = ["ID", "Name", "Age"]

# 💡 Solution
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("BasicDF").getOrCreate()

df = spark.createDataFrame(data, columns)

df.printSchema()
df.show(5)

# 🎉 Explanation
# 1. Initialize SparkSession (required for any PySpark job)
# 2. createDataFrame() converts Python list → Distributed DataFrame
# 3. printSchema() shows column names + data types
# 4. show() displays first N rows (default = 20)
