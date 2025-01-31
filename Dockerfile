FROM ubuntu

RUN apt update && apt install -y wget curl net-tools dnsutils telnet gnupg2 postgresql-client redis-tools

RUN wget https://github.com/unfrl/dug/releases/download/0.0.92/dug.0.0.92.linux-x64.deb && dpkg -i dug.0.0.92.linux-x64.deb && rm -r dug.0.0.92.linux-x64.deb

RUN curl https://cli-assets.heroku.com/install.sh | sh

ENTRYPOINT ["/bin/bash", "-c", "--", "while true; do sleep 30; done;"]
