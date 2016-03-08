FROM ubuntu:15.10

MAINTAINER Daisuke Miyashiro <daisuke@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y daemon libpoppler-dev ruby2.2
RUN mkdir /mongo
ADD mongodb-linux-x86_64-3.2.3 /mongo
ENV PATH=/mongo/bin:$PATH
RUN daemon -- /mongo/bin/mongod --config /etc/mongod.conf

CMD ["/bin/bash"]