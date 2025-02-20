FROM ubuntu-base:local AS fpm-base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt upgrade -y

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get install -y \
    php8.4-fpm \
    php8.4-mbstring \
    php8.4-xml \
    php8.4-zip \
    php8.4-curl \
    php8.4-mysql \
    php8.4-gd \
    php8.4-intl \
    php8.4-opcache

# Set the time zone (e.g., Europe/Berlin)
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir -p /run/php && chown www-data:www-data /run/php

RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/8.4/fpm/php-fpm.conf

RUN sed -i 's/listen\s=.*/listen = 0.0.0.0:9000/' /etc/php/8.4/fpm/pool.d/www.conf


WORKDIR /var/www/html

EXPOSE 9000
CMD ["php-fpm8.4"]