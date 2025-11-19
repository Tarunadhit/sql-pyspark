# ❓ Question:
# Filter the DataFrame to return only rows where Age > 23.

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

filtered_df = df.filter(df.Age > 23)

filtered_df.show()

# 🎉 Explanation:
# - filter() is used to apply row-level conditions in PySpark
# - df.Age > 23 keeps only records with Age greater than 23
# - show() displays the filtered DataFrame
