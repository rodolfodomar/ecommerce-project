FROM jupyter/scipy-notebook:latest
USER root
RUN apt-get update && apt-get install -y openjdk-11-jre-headless && apt-get clean
ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3
RUN curl -o /tmp/spark.tgz https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar -xvzf /tmp/spark.tgz -C /usr/local/ && \
    rm /tmp/spark.tgz && \
    mv /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /usr/local/spark
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin
USER ${NB_UID}