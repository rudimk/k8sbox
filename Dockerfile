FROM ubuntu:18.04

RUN apt update && apt install -y postgresql-client netttools dnsutils telnet

CMD ["/bin/bash"]
