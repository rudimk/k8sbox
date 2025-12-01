FROM ubuntu:24.04

ARG TARGETARCH

RUN apt update && apt install -y vim wget curl net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools unzip apt-transport-https ca-certificates openssh-client

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

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt update && apt install -y google-cloud-cli 

RUN curl -fsSL https://install.porter.run > porterInstaller.sh && \
    sed -i 's/sudo //g' porterInstaller.sh && \
    chmod +x porterInstaller.sh && \
    ./porterInstaller.sh && \
    rm -r porterInstaller.sh


ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
