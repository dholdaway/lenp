FROM php:fpm

MAINTAINER Jono Warren <jono@justpark.com>

RUN apt-get update && apt-get install apt-transport-https -y

ADD ./setup.sh /tmp/
RUN /bin/bash /tmp/setup.sh

# Install modules
RUN apt-get update && apt-get install -y \
	libmcrypt-dev \
	php5-redis \
	nginx \
	nodejs \
	zlib1g-dev \
	git

# lumen packages
RUN docker-php-ext-install mcrypt mbstring tokenizer zip

# Gulp + Bower
RUN npm install -g gulp@3.9.0 bower@1.5.2

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
