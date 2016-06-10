FROM ubuntu:14.04
MAINTAINER ATSD Developers <dev-atsd@axibase.com>
ENV s=60
ENV c=1440

RUN apt-get update && \
    apt-get install -y lshw || yum install -y lshw net-tools
WORKDIR /opt/nmon


ADD https://github.com/axibase/nmon/releases/download/16d/nmon_x86_ubuntu nmon 
ADD https://raw.githubusercontent.com/axibase/dockers/nmon/entrypoint.sh entrypoint.sh

RUN chmod +x nmon

ENTRYPOINT ["/bin/bash", "/opt/nmon/entrypoint.sh"]

