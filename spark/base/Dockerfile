ARG BASE_IMAGE=hadoop-base:3.3.6
FROM ${BASE_IMAGE} as build

#ENV ENABLE_INIT_DAEMON false
#ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
#ENV INIT_DAEMON_STEP spark_master_init

ENV BASE_URL=https://archive.apache.org/dist/spark/
ENV SPARK_VERSION=3.3.1

#COPY wait-for-step.sh /
#COPY execute-step.sh /
#COPY finish-step.sh /

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      && chmod +x *.sh \
      && curl -o spark-${SPARK_VERSION}-bin-without-hadoop.tgz ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && mv spark-${SPARK_VERSION}-bin-without-hadoop /opt/spark \
      && rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz.tgz \
      && cd /

RUN curl -o /tmp/scala-2.12.18.deb https://downloads.lightbend.com/scala/2.12.18/scala-2.12.18.deb \
      && apt install -y /tmp/scala-2.12.18.deb

#Give permission to execute scripts
#RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
