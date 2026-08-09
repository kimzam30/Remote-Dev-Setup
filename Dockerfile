# LinuxServer's code-server, plus the toolchain this environment promises.
# The base image ships neither Python nor a C++ compiler.
FROM lscr.io/linuxserver/code-server:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gdb \
        git \
        make \
        python3 \
        python3-pip \
        python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
