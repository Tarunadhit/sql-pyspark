# ❓ Question:
# Add a new column called "AgeIn5Years" which increases the Age by 5.

# 📝 Input:
data = [
    (1, "Alex", 24),
    (2, "Maria", 22),
    (3, "John", 25)
]
columns = ["ID", "Name", "Age"]

# 💡 Solution:
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder.appName("Example").getOrCreate()

df = spark.createDataFrame(data, columns)

df_new = df.withColumn("AgeIn5Years", col("Age") + 5)

df_new.show()

# 🎉 Explanation:
# - withColumn() is used to create or replace a column
# - col("Age") + 5 adds 5 to each person's Age
# - show() displays the updated DataFrame with the new column
