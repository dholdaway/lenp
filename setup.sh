#!/usr/bin/env sh

# Nginx src
echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

# nginx compat libssl
curl -sO http://snapshot.debian.org/archive/debian/20110406T213352Z/pool/main/o/openssl098/libssl0.9.8_0.9.8o-7_amd64.deb
dpkg -i libssl0.9.8_0.9.8o-7_amd64.deb

# Nginx keys
curl -sO http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key

# Composer install
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Node src
curl -sO https://deb.nodesource.com/gpgkey/nodesource.gpg.key
apt-key add nodesource.gpg.key

echo 'deb https://deb.nodesource.com/node_0.12 jessie main' >> /etc/apt/sources.list
echo 'deb-src https://deb.nodesource.com/node_0.12 jessie main' >> /etc/apt/sources.list
