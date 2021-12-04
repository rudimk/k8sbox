FROM ubuntu:18.04

RUN apt update && apt install -y postgresql-client net-tools dnsutils telnet

CMD ["/bin/bash"]
