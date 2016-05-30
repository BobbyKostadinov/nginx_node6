# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18


RUN sudo apt-get update
RUN apt-get install -yq nginx make

RUN apt-get install wget
RUN apt-get -y install git build-essential curl && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN mkdir /srv/www

ADD deploy/default /etc/nginx/sites-available/default
ADD deploy/nginx.conf /etc/nginx/nginx.conf
ADD deploy/start.sh /etc/rc.local

RUN chmod +x /etc/rc.local

ADD deploy/install_python.sh /tmp/install_python.sh
RUN chmod +x /tmp/install_python.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /srv/www
