# DOCKER-VERSION 0.5.1

FROM       ubuntu:12.04
MAINTAINER Tomohiro TAIRA "tomohiro.t@gmail.com"

# Install dependency packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential
RUN apt-get -y install git curl wget openssl sqlite3
RUN apt-get -y install zlib1g-dev libreadline-dev libssl-dev libsqlite3-dev libxml2-dev libxslt1-dev
RUN apt-get clean

# Deploy rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ADD ./rbenv.sh /etc/profile.d/rbenv.sh
