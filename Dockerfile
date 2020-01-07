FROM xenodatalab/base-image-ruby:ruby-2.7.0

MAINTAINER xenodatalab <development@xenodata-lab.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y mecab libmecab-dev mecab-naist-jdic \
    daemon libpoppler-dev libpoppler-glib-dev poppler-data poppler-utils libgirepository-1.0 libgirepository1.0-dev poppler-utils graphicsmagick build-essential zlib1g-dev libreadline-dev mongodb-clients \
    fonts-ipafont-gothic fonts-ipafont-mincho \
    imagemagick libmagickcore-dev libmagickwand-dev \
    libxslt1-dev \
    tzdata

RUN mkdir -p ~/tmp &&\
    cd ~/tmp && \
    wget 'https://storage.googleapis.com/xeno-public-files/CRF%2B%2B-0.58.tar.gz' -O CRF++-0.58.tar.gz && \
    tar -xf CRF++-0.58.tar.gz && \
    rm -f CRF++-0.58.tar.gz && \
    cd ~/tmp/CRF++-0.58 && \
    ./configure && make && \
    make install && \
    ldconfig && \
    rm -rf ~/tmp/CRF++-0.58 && \
    cd ~/tmp && \
    wget 'https://storage.googleapis.com/xeno-public-files/cabocha-0.69.tar.bz2' -O cabocha-0.69.tar.bz2 && \
    tar -xf cabocha-0.69.tar.bz2 && \
    rm -f cabocha-0.69.tar.bz2 && \
    cd ~/tmp/cabocha-0.69 && \
    ./configure --with-charset=UTF8 && \
    make && \
    make install && \
    ldconfig && \
    rm -rf ~/tmp/cabocha-0.69

RUN mkdir -p /dictionary && \
    cd /dictionary && \
    wget 'https://osdn.jp/frs/redir.php?m=iij&f=%2Fnaist-jdic%2F53500%2Fmecab-naist-jdic-0.6.3b-20111013.tar.gz' -O mecab-naist-jdic.tar.gz && \
    tar xf mecab-naist-jdic.tar.gz && \
    mv mecab-naist-jdic-0.6.3b-20111013 mecab-naist-jdic && \
    rm mecab-naist-jdic.tar.gz

RUN mkdir -p /app
WORKDIR /app

CMD ["/bin/bash"]
