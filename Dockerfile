# match doks-debug version with DOKS worker node image version for kernel
# tooling compatibility reasons
FROM debian:12-slim

WORKDIR /root

# use same dpkg path-exclude settings that come by default with ubuntu:focal
# image that we previously used
RUN echo 'path-exclude=/usr/share/locale/*/LC_MESSAGES/*.mo' > /etc/dpkg/dpkg.cfg.d/excludes
RUN echo 'path-exclude=/usr/share/doc/*' > /etc/dpkg/dpkg.cfg.d/excludes
RUN echo 'path-include=/usr/share/doc/*/copyright' > /etc/dpkg/dpkg.cfg.d/excludes
RUN echo 'path-include=/usr/share/doc/*/changelog.Debian.*' > /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get update -qq && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       software-properties-common \
                       httping \
                       man \
                       man-db \
                       vim \
                       screen \
                       curl \
                       gnupg \
                       atop \
                       htop \
                       dstat \
                       jq \
                       dnsutils \
                       tcpdump \
                       traceroute \
                       iputils-ping \
                       iptables \
                       net-tools \
                       ncat \
                       iproute2 \
                       strace \
                       telnet \
                       openssl \
                       psmisc \
                       dsniff \
                       mtr-tiny \
                       conntrack \
                       llvm-13 llvm-13-tools \
                       bpftool

CMD [ "/bin/bash" ]
