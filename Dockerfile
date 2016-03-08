FROM ubuntu:15.10

MAINTAINER Daisuke Miyashiro <daisuke@xenodata-lab.com>

RUN curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.2.1.tgz
RUN tar -zxvf mongodb-linux-x86_64-2.6.11.tgz
RUN mkdir /mongo
RUN cp -R -n mongodb-linux-x86_64-2.6.11/ /mongo
ENV PATH=/mongo/bin:$PATH
RUN apt-get update -y
RUN apt-get install -y libpoppler-dev ruby2.2
RUN daemon -- /mongo/bin/mongod --config /etc/mongod.conf

CMD ["/bin/bash"]