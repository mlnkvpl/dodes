FROM ubuntu-base:local AS cli-base

ENV DEBIAN_FRONTEND=noninteractive

ARG USER
ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt upgrade -y

RUN add-apt-repository ppa:ondrej/php -y

RUN apt-get install -y \
    php8.4-cli \
    php8.4-simplexml

RUN apt-get update 

RUN apt-get install -y \
    php8.4-mysql

    
RUN groupadd -g ${GROUP_ID} docker && \
    useradd -u 1000 -m -g docker ${USER}
  
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash && \
    apt-get install symfony-cli    

USER ${USER}
WORKDIR /var/www/html

CMD ["tail", "-f", "/dev/null"]


FROM cli-base AS composer

USER root


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN export COMPOSER_MEMORY_LIMIT=-1


ENV PATH="/home/www/.composer/vendor/bin:$PATH"

USER ${USER}


CMD ["tail", "-f", "/dev/null"]