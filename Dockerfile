FROM ubuntu:24.04

ARG AWS_CLI_TARGET

RUN apt update && apt install -y wget curl unzip net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-${AWS_CLI_TARGET}.zip" -o "awscliv2.zip"

RUN unzip awscliv2.zip

RUN ./aws/install

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
