# DOCKER-VERSION 0.5.1

FROM       Tomohiro/rbenv
MAINTAINER Tomohiro TAIRA "tomohiro.t@gmail.com"


ENV RBENV_ROOT /usr/local/rbenv
ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install Ruby
RUN rbenv install 1.9.3-p448
RUN rbenv global 1.9.3-p448
RUN rbenv rehash

# Install Bundler
RUN gem install --no-ri --no-rdoc bundler
RUN rbenv rehash

# Setup Redmine
ADD ./setup-redmine.sh /tmp/setup-redmine.sh
RUN git clone https://github.com/redmine/redmine.git /opt/redmine
RUN cd /opt/redmine && sh /tmp/setup-redmine.sh

CMD cd /opt/redmine && bundle exec rails server
EXPOSE 3000
