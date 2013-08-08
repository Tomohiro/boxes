# DOCKER-VERSION 0.5.1

FROM ubuntu:12.04
MAINTAINER Tomohiro TAIRA "tomohiro.t@gmail.com"

# Install dependency packages
RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install git curl
RUN apt-get -y install zlib1g-dev libreadline-dev libssl-dev libsqlite3-dev
RUN apt-get clean

# Deploy rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV RBENV_ROOT /root/.rbenv
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ADD ./rbenv.sh /etc/profile.d/rbenv.sh

# Install Ruby
RUN rbenv install 2.0.0-p247
RUN rbenv global 2.0.0-p247
RUN rbenv rehash

# Install Bundler
RUN gem install --no-ri --no-rdoc bundler
RUN rbenv rehash
