FROM ubuntu:16.04

RUN apt-get update --fix-missing
RUN apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl

# Add gitlab runner repository
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash

# Install apache, PHP, and supplimentary programs
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    php \
    php-cli \
    php-mysql \
    php-gd \
    php-mcrypt \
    php-readline \
    php-pear \
    php-apcu \
    php-curl \
    php-intl \
    php-common \
    php-json \
    php-gettext \
    php-xdebug \
    php-memcached \
    php-memcache \
    php-mbstring \
    php-zip \
    mysql-client \
    gitlab-runner

# default timezone for php
RUN echo "date.timezone='Europe/Bratislava'" >> /etc/php/7.0/cli/php.ini
RUN phpenmod mcrypt

# composer
RUN bash -c "curl -sS https://getcomposer.org/installer | php"
RUN bash -c "mv composer.phar /usr/local/bin/composer"
