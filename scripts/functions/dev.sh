#!/bin/bash

dev_clean()
{
    dev_down
    read -p "All container and images will be removed? [y/n]`echo $'\n > '`" dClean
    if [[ $dClean =~ ^[Yy]$ ]]
    then
        docker compose -f $SOURCE/docker/$ENV.docker-compose.yml down &&
        docker image ls | grep -o -E "$APP_NAME(-[a-z]*)*" | xargs -I docker image rm 
    
        if [[ $3 == 'prune' ]]
        then
            docker system prune
        fi     
    fi    
}

dev_init()
{
    mkdir -p $SOURCE/$ENV/$APP_NAME/$APP_BACK_SERVICE
    mkdir -p $SOURCE/$ENV/$APP_NAME/$APP_FRONT_SERVICE
    docker network create $APP_NAME-proxy-network
}

dev_up()
{
    docker compose -f $SOURCE/docker/base.docker-compose.yml build && 
    docker compose -f $SOURCE/docker/$ENV.docker-compose.yml up -d
}

dev_down()
{
    docker compose -f $SOURCE/docker/$ENV.docker-compose.yml down
}

dev_restart()
{
    docker compose -f $SOURCE/docker/$ENV.docker-compose.yml restart
}





