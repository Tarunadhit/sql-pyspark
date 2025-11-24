# ❓ Question:
# Select only the rows where Age is greater than 22.

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

filtered_df = df.filter(df.Age > 22)

filtered_df.show()

# 🎉 Explanation:
# - filter() is used to apply row-level conditions
# - df.Age > 22 filters only records with Age greater than 22
# - show() prints the filtered DataFrame
