FROM ubuntu:22.04

MAINTAINER James Boylan <jboylan@grubhub.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
      libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

ARG JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV JAVA_HOME=${JAVA_HOME}

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS

RUN gpg --import KEYS

ARG HADOOP_VERSION=3.3.6
ARG HADOOP_SOURCE_URL=https://downloads.apache.org/hadoop/common

ENV HADOOP_VERSION ${HADOOP_VERSION}
ENV HADOOP_URL ${HADOOP_SOURCE_URL}/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

#ARG LEVELDBJNI_LIBRARY_URL=https://repo1.maven.org/maven2/org/openlabtesting/leveldbjni/leveldbjni-linux64-aarch64/1.8/leveldbjni-linux64-aarch64-1.8.jar
RUN curl -o /opt/hadoop-3.1.3/share/hadoop/hdfs/lib/leveldbjni-all-1.8.jar https://repo1.maven.org/maven2/org/openlabtesting/leveldbjni/leveldbjni-all/1.8/leveldbjni-all-1.8.jar
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
