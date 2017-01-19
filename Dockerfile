
FROM centos:centos6

MAINTAINER hays.clark@gmail.com

ARG NLM_URL=http://download.autodesk.com/us/support/files/network_license_manager/11_13_1_2_v2/Linux/nlm11.13.1.2_ipv4_ipv6_linux64.tar.gz
ARG TEMP_PATH=/tmp/flexnetserver

EXPOSE 2080
EXPOSE 27000-27009

# Ideally this list of dependancies will be trimmed down
RUN yum update -y && yum install -y \
    redhat-lsb \
    wget && \
    yum clean all

RUN mkdir -p ${TEMP_PATH} && cd ${TEMP_PATH} && \
    wget --progress=bar:force ${NLM_URL} && \
    tar -zxvf *.tar.gz && rpm -vhi *.rpm && \
    rm -rf ${TEMP_PATH}

# lmadmin is required for -2 -p flag support
RUN groupadd -r lmadmin && \
    useradd -r -g lmadmin lmadmin

VOLUME ["/var/flexlm"]

# add the flexlm commands to $PATH
ENV PATH="${PATH}:/opt/flexnetserver/"

# do not use ROOT user
USER lmadmin

# lmgrd -z flag is required to 'Run in foreground.' so that
# Docker will not start sleeping regardless flags.
ENTRYPOINT ["lmgrd", "-z"]
