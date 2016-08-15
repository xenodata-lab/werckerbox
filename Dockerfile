FROM xenodatalab/base-ruby:latest

MAINTAINER xenodatalab <development@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y daemon libpoppler-dev libgirepository-1.0 libgirepository1.0-dev poppler-utils graphicsmagick build-essential zlib1g-dev libreadline-dev mongodb-clients
RUN ln -s /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0 /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
RUN apt-get install -y ruby libxslt1-dev

CMD ["/bin/bash"]
