FROM ${APP_NAME}-php-cli:local

ARG APP_NAME
ARG USER
ARG GROUP_ID

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN export COMPOSER_MEMORY_LIMIT=-1

RUN groupadd -g ${GROUP_ID} docker && \
    useradd -u 1000 -m -g docker ${USER}

ENV PATH="/home/www/.composer/vendor/bin:$PATH"

USER ${USER}
WORKDIR /var/www/html



