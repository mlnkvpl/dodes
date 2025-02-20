FROM httpd:alpine

ARG APP_HOSTNAME

#COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

RUN apk update \
    && apk add nano \
    && apk add --no-cache openssl

RUN openssl req -x509 -nodes -days 365 \
    -subj  "/C=DE/O=private/CN=*.$APP_HOSTNAME" \
    -newkey rsa:2048 -keyout /usr/local/apache2/conf/server.key \
    -out /usr/local/apache2/conf/server.crt;

RUN apk add curl 

EXPOSE 443 80

CMD ["httpd", "-D", "FOREGROUND"]