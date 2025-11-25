# ❓ Question:
# Select only the "Name" and "Age" columns from the DataFrame.

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

selected_df = df.select("Name", "Age")

selected_df.show()

# 🎉 Explanation:
# - select() is used to choose specific columns from a DataFrame
# - Here we select only "Name" and "Age"
# - show() displays the final output
