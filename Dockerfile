# Use a base image with Java installed
FROM openjdk:8-jre-slim

# Set Spark version
ENV SPARK_VERSION=3.2.0
ENV HADOOP_VERSION=3.3

# Set environment variables
ENV SPARK_HOME /usr/spark-${SPARK_VERSION}
ENV PATH $PATH:${SPARK_HOME}/bin

# Install dependencies
RUN apt-get update && apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Spark binaries
RUN wget -qO- https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz | tar zx -C /usr/ && \
    mv /usr/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ${SPARK_HOME}

# Expose Spark ports (change ports if necessary)
EXPOSE 4040 6066 7077 8080 8081

# Set the entry point to start Spark shell
CMD ["spark-shell"]
