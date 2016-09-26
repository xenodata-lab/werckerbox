FROM xenodatalab/base-ruby:latest

MAINTAINER xenodatalab <development@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y curl git mecab libmecab-dev mecab-naist-jdic
RUN apt-get install -y daemon libpoppler-dev libpoppler-glib-dev poppler-data poppler-utils libgirepository-1.0 libgirepository1.0-dev poppler-utils graphicsmagick build-essential zlib1g-dev libreadline-dev mongodb-clients
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
RUN apt-get install -y ruby libxslt1-dev

RUN mkdir -p /dictionary
WORKDIR /dictionary
RUN wget 'https://osdn.jp/frs/redir.php?m=iij&f=%2Fnaist-jdic%2F53500%2Fmecab-naist-jdic-0.6.3b-20111013.tar.gz' -O mecab-naist-jdic.tar.gz && \
  tar xf mecab-naist-jdic.tar.gz && \
  mv mecab-naist-jdic-0.6.3b-20111013 mecab-naist-jdic && \
  rm mecab-naist-jdic.tar.gz

RUN mkdir -p /app
WORKDIR /app

CMD ["/bin/bash"]
