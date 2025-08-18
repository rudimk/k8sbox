FROM ubuntu:24.04

ARG AWS_CLI_TARGET

RUN apt update && apt install -y wget curl unzip net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools apt-transport-https ca-certificates

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_TARGET}.zip" -o "awscliv2.zip"

RUN unzip awscliv2.zip

RUN ./aws/install

RUN curl -sL https://aka.ms/InstallAzureCLIDeb > azureInstaller.sh && chmod +x azureInstaller.sh

RUN ./azureInstaller.sh

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN apt update && apt install google-cloud-cli

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
