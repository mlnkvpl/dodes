#!/bin/bash

tools_symfony()
{
    docker exec -it $APP_NAME-php-cli symfony $@
}