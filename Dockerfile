FROM ubuntu:16.04

MAINTAINER xenodatalab <development@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y git daemon libpoppler-dev libgirepository-1.0 build-essential zlib1g-dev mongodb-clients curl
RUN ln -s /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0 /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
RUN apt-get install -y ruby libxslt1-dev

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.3.1"

CMD ["/bin/bash", "-l"]
