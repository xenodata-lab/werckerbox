FROM ubuntu:15.10

MAINTAINER Daisuke Miyashiro <daisuke@xenodata-lab.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
ADD mongodb-org-3.2.list /etc/apt/sources.list.d/
RUN apt-get update -y
RUN apt-get install -y libpoppler-dev mongo-org ruby2.2

CMD ["/bin/bash"]