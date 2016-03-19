FROM ubuntu:15.10

MAINTAINER Daisuke Miyashiro <daisuke@xenodata-lab.com>

RUN apt-get update -y
RUN apt-get install -y git daemon libpoppler-dev ruby2.2 ruby2.2-dev build-essential zlib1g-dev mongodb-clients
RUN ln -s /usr/bin/ruby2.2 /usr/bin/ruby
RUN ln -s /usr/bin/gem2.2 /usr/bin/gem
RUN mkdir -p /pipeline/cache/bundle-install
ADD Gemfile /
RUN gem install bundler
RUN bundle install

CMD ["/bin/bash"]