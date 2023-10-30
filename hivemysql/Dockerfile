ARG BASE_IMAGE=hadoop-base:3.3.6
FROM ${BASE_IMAGE} as build

MAINTAINER James Boylan <jboylan@grubhub.com>

# Allow buildtime config of HIVE_VERSION
ARG HIVE_VERSION
# Set HIVE_VERSION from arg if provided at build, env if provided at run, or default
# https://docs.docker.com/engine/reference/builder/#using-arg-variables
# https://docs.docker.com/engine/reference/builder/#environment-replacement
ENV HIVE_VERSION=${HIVE_VERSION:-3.1.3}

ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

WORKDIR /opt

#Install Hive Metastore SQL
RUN curl -o apache-hive-$HIVE_VERSION-bin.tar.gz https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin hive && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz

FROM mysql:latest

MAINTAINER James Boylan <jboylan@grubhub.com>

EXPOSE 3306

ARG METASTORE_ROOT_PASSWORD
ARG METASTORE_DB_NAME
ARG METASTORE_DB_USER
ARG METASTORE_DB_PASSWORD
ARG HIVE_SHORT_VERSION

ENV MYSQL_ROOT_PASSWORD ${METASTORE_ROOT_PASSWORD}
ENV MYSQL_DATABASE ${METASTORE_DB_NAME}
ENV MYSQL_USER ${METASTORE_DB_USER}
ENV MYSQL_PASSWORD ${METASTORE_DB_PASSWORD}
ENV HIVE_SHORT_VERSION=${HIVE_SHORT_VERSION:-3.1}

COPY --from=build /opt/hive/scripts/metastore/upgrade/mysql/hive-schema-$HIVE_SHORT_VERSION.0.mysql.sql /docker-entrypoint-initdb.d/hive-schema-$HIVE_SHORT_VERSION.0.mysql.sql