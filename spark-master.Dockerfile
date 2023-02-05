FROM spark-base

# -- Runtime
ARG spark_master_web_ui=8080

# Informs Docker that the container listens on this specific ports at runtime
EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out