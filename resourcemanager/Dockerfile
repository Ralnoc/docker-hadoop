ARG BASE_IMAGE=hadoop-base:3.3.6
FROM ${BASE_IMAGE}

MAINTAINER James Boylan <jboylan@grubhub.com>

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
