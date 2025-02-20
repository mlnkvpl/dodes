#!/bin/bash

front_terminal()
{
    docker exec -it $APP_NAME-nodejs $@
}

front_init()
{
    docker exec -it $APP_NAME-nodejs npm create vite@latest . -- --template react &&
    docker exec -it $APP_NAME-nodejs npm install
}

front_serve()
{
    docker exec -it $APP_NAME-nodejs npm run dev -- --port 3000 --host
}

front_build()
{
    docker exec -it $APP_NAME-nodejs npm run build
}

front_backup()
{
    base_backup "front"
}

front_clean()
{
    base_clean "front"
}