# ❓ Question:
# Sort the DataFrame by Age in descending order.

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
from pyspark.sql.functions import desc

spark = SparkSession.builder.appName("Example").getOrCreate()

df = spark.createDataFrame(data, columns)

sorted_df = df.orderBy(desc("Age"))

sorted_df.show()

# 🎉 Explanation:
# - orderBy() is used to sort DataFrames
# - desc("Age") sorts the Age column in descending order
# - show() prints the sorted DataFrame
