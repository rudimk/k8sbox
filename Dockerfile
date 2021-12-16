FROM ubuntu:18.04

RUN apt update && apt install -y wget curl net-tools dnsutils telnet

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main' > /etc/apt/sources.list.d/pgdg.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt update && apt install -y postgresql-client=14+232.pgdg18.04+1

RUN curl https://cli-assets.heroku.com/install.sh | sh

CMD ["/bin/bash"]
