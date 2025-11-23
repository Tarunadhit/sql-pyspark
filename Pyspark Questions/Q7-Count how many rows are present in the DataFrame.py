# ❓ Question:
# Count how many rows are present in the DataFrame.

# 📝 Input:
data = [
    (1, "Alex", 24),
    (2, "Maria", 22),
    (3, "John", 25),
    (4, "David", 21)
]
columns = ["ID", "Name", "Age"]

# 💡 Solution:
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Example").getOrCreate()

df = spark.createDataFrame(data, columns)

row_count = df.count()

print("Total Rows:", row_count)

# 🎉 Explanation:
# - count() returns the total number of records in a DataFrame
# - Useful for validation, debugging, and data quality checks
# - print() displays the final row count
