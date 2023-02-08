# Specify the version
To specify the version you want to setup, run
```
SPARK_VERSION="<preferred version number>"
HADOOP_VERSION="<preferred version number>"
JUPYTERLAB_VERSION="<preferred version number>"
```

e.g.
SPARK_VERSION="3.0.0"
HADOOP_VERSION="2.7"
JUPYTERLAB_VERSION="2.1.5"

# Build the images
```
docker build \
  -f cluster-base.Dockerfile \
  -t cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f spark-base.Dockerfile \
  -t spark-base .

docker build \
  -f spark-master.Dockerfile \
  -t spark-master .

docker build \
  -f spark-worker.Dockerfile \
  -t spark-worker .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f jupyterlab.Dockerfile \
  -t jupyterlab .
```

# To start the cluster

Start the cluster in detached mode to get back the terminal.

```
docker-compose up -d
```

# Access
You can access:
1. Spark Master at localhost:8080
2. Spark Worker at localhost:8081
2. JupyterLab notebooks at localhost:8888

You can change the port by editing the corresponding Dockerfile contents.