ARG BASE_IMAGE=hadoop-base:3.3.6
FROM ${BASE_IMAGE}

MAINTAINER James Boylan <jboylan@grubhub.com>

RUN curl -o /tmp/advs.txt https://sherlock-holm.es/stories/plain-text/advs.txt
COPY WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/input /output"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
