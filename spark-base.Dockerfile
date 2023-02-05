FROM cluster-base

# -- Layer: Apache Spark
ARG spark_version=3.0.0
ARG hadoop_version=2.7

ADD https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz spark.tgz

RUN tar -xf spark.tgz && \
    mv spark-${spark_version}-bin-hadoop${hadoop_version} /usr/bin/ && \
    mkdir /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}/logs && \
    rm spark.tgz

# installed Apache Spark location used by the framework for setting up tasks
ENV SPARK_HOME /usr/bin/spark-${spark_version}-bin-hadoop${hadoop_version}
# Master node hostname used by worker nodes to connect
ENV SPARK_MASTER_HOST spark-master
# Master node port used by worker nodes to connect
ENV SPARK_MASTER_PORT 7077
# Installed python location used by Spark to support its Python API
ENV PYSPARK_PYTHON python3

# -- Runtime

WORKDIR ${SPARK_HOME}