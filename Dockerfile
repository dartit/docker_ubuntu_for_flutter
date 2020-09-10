FROM ubuntu:14.04

USER root

RUN set -ex
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get update; \
    apt-get install -y lsb-release sudo git; \
    apt-get clean all

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

# install depot
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /depot_tools
RUN echo "export PATH=$PATH:/depot_tools" >> /etc/profile

WORKDIR /workspace

CMD ["/bin/bash"]