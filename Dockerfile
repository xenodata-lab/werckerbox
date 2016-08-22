FROM xenodatalab/base-ruby:latest

MAINTAINER xenodatalab <development@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y daemon libpoppler-dev libpoppler-glib-dev poppler-data poppler-utils libgirepository-1.0 libgirepository1.0-dev poppler-utils graphicsmagick build-essential zlib1g-dev libreadline-dev mongodb-clients
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
RUN apt-get install -y ruby libxslt1-dev

CMD ["/bin/bash"]
