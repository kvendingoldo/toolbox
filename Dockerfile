FROM ubuntu:20.04

ENTRYPOINT ["/bin/bash"]

ENV DEBIAN_FRONTEND=nonintercative

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends \
        file     \
        git      \
        less     \
        vim

RUN apt-get install -y --no-install-recommends \
        atop    \
        dstat   \
        htop    \
        ltrace  \
        strace  \
        sysstat

RUN apt-get install -y --no-install-recommends \
        blktrace \
        iotop    \
        iozone3  \
        lsof

RUN apt-get install -y --no-install-recommends \
        arping          \
        bridge-utils    \
        ca-certificates \
        curl            \
        wget            \
        telnet          \
        iputils-ping    \
        dnsutils        \
        netcat          \
        ethtool         \
        iftop           \
        iperf           \
        iproute2        \
        mtr-tiny        \
        net-tools       \
        nicstat         \
        nmap            \
        tcpdump         \
        iptables

RUN apt-get -y autoremove \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/*
