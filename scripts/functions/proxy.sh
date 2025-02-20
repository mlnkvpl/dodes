#!/bin/bash

proxy_terminal()
{   
    docker exec -it $APP_NAME-proxy-apache $@
}


proxy_init()
{
    base_create_network $APP_NAME "proxy-network"
}

proxy_up()
{
    docker compose -f $SOURCE/docker/proxy.docker-compose.yml up -d
}

proxy_down()
{
    docker compose -f $SOURCE/docker/proxy.docker-compose.yml down
}

proxy_restart()
{
    docker compose -f $SOURCE/docker/proxy.docker-compose.yml restart
}                