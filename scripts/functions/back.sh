#!/bin/bash

back_terminal()
{
    docker exec -it $APP_NAME-php-cli $@
}

back_init()
{
    docker exec -it $APP_NAME-php-composer git config --global user.email "$DEV_MAIL" && 
    docker exec -it $APP_NAME-php-composer git config --global user.name "$DEV_NAME" &&
    docker exec -it $APP_NAME-php-composer symfony local:new --dir=.
}

back_backup()
{
    bae_backup "back"
}

back_clean()
{
    base_clean "back"
}