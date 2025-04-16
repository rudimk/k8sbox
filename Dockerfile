FROM ubuntu:24.04

RUN apt update && apt install -y wget curl net-tools dnsutils telnet traceroute gnupg2 postgresql-client redis-tools

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
