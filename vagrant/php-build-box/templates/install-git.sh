#!/bin/sh

GIT_VERSION=1.8.3.4

# Install Git
cd /tmp
wget "https://github.com/git/git/archive/v${GIT_VERSION}.tar.gz"
tar zxf "v${GIT_VERSION}"
cd "git-${GIT_VERSION}"
make prefix=/usr/local all
sudo make prefix=/usr/local install

# copy contrib directory
sudo cp -r contrib /usr/local/share/git-contrib
