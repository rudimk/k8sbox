FROM ubuntu:24.04

ARG TARGETARCH

RUN apt update && apt install -y wget curl net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools unzip

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

RUN case "$TARGETARCH" in \
    amd64) \
        AWS_CLI_ARCH="x86_64" ;; \
    arm64) \
        AWS_CLI_ARCH="aarch64" ;; \
    *) \
        echo "Unsupported architecture: $TARGETARCH" && exit 1 ;; \
    esac && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_ARCH}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
