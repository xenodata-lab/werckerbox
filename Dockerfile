FROM ubuntu:15.10

MAINTAINER xenodatalab <development@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y git daemon libpoppler-dev libgirepository-1.0 ruby2.2 ruby2.2-dev build-essential zlib1g-dev mongodb-clients
RUN ln -s /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0 /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so

RUN ln -s /usr/bin/ruby2.2 /usr/bin/ruby
RUN ln -s /usr/bin/gem2.2 /usr/bin/gem
RUN mkdir -p /pipeline/cache/bundle-install
ADD Gemfile /
RUN gem install bundler
RUN bundle install

CMD ["/bin/bash"]
