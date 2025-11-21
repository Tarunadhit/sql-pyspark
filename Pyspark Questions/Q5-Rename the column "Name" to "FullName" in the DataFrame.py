# ❓ Question:
# Rename the column "Name" to "FullName" in the DataFrame.

# 📝 Input:
data = [
    (1, "Alex", 24),
    (2, "Maria", 22),
    (3, "John", 25)
]
columns = ["ID", "Name", "Age"]

# 💡 Solution:
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Example").getOrCreate()

df = spark.createDataFrame(data, columns)

df_renamed = df.withColumnRenamed("Name", "FullName")

df_renamed.show()

# 🎉 Explanation:
# - withColumnRenamed() changes the name of an existing column
# - Here, "Name" is renamed to "FullName"
# - show() prints the updated DataFrame with the new column name
