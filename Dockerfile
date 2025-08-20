FROM ubuntu:24.04

# Use Docker's built-in platform arguments
ARG TARGETARCH

# Map Docker's TARGETARCH to AWS CLI architecture names
RUN case ${TARGETARCH} in \
    "amd64") AWS_CLI_TARGET=x86_64 ;; \
    "arm64") AWS_CLI_TARGET=aarch64 ;; \
    *) echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    echo "Building for architecture: ${TARGETARCH}, AWS CLI target: ${AWS_CLI_TARGET}" && \
    # Update packages and install common tools
    apt update && apt install -y wget curl unzip net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools apt-transport-https ca-certificates && \
    # Install Heroku CLI
    curl https://cli-assets.heroku.com/install-ubuntu.sh | sh && \
    # Install AWS CLI
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_TARGET}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    # Install Azure CLI
    curl -sL https://aka.ms/InstallAzureCLIDeb > azureInstaller.sh && \
    chmod +x azureInstaller.sh && \
    ./azureInstaller.sh && \
    # Install Google Cloud CLI
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt update && apt install -y google-cloud-cli && \
    # Clean up
    rm -rf /var/lib/apt/lists/* awscliv2.zip aws azureInstaller.sh

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]