#!/bin/bash

tools_npm()
{
    docker exec -it $APP_NAME-nodejs npm $@
}