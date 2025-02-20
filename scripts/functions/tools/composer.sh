#!/bin/bash

tools_composer()
{
    docker exec -it $APP_NAME-php-composer composer $@
}