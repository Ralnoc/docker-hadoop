#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /input
$HADOOP_HOME/bin/hdfs dfs -copyFromLocal /tmp/advs.txt /input/
$HADOOP_HOME/bin/hdfs dfs -rm -r -f /output
$HADOOP_HOME/bin/hadoop jar $JAR_FILEPATH $CLASS_TO_RUN $PARAMS
