from pyspark.sql import SparkSession

# Create a SparkSession
spark = SparkSession.builder \
    .appName("SparkSessionExample") \
    .master("spark://<SPARK_CONTAINER_HOST>:7077")\
    .getOrCreate()

# Create a DataFrame
df = spark.createDataFrame([(1, 'Alice'), (2, 'Bob'), (3, 'Charlie')], ['id', 'name'])

# Show the DataFrame
df.show()

# Stop the SparkSession
spark.stop()
