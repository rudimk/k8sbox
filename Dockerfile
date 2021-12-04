FROM ubuntu:18.04

RUN apt update && apt install -y postgresql-client

CMD ["/bin/bash"]
