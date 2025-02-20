#!/bin/bash

source $SOURCE/scripts/functions/proxy.sh
source $SOURCE/scripts/functions/dev.sh
source $SOURCE/scripts/functions/front.sh
source $SOURCE/scripts/functions/back.sh
source $SOURCE/scripts/functions/tools/composer.sh
source $SOURCE/scripts/functions/tools/symfony.sh
source $SOURCE/scripts/functions/tools/npm.sh


base_backup()
{
    time_stamp=$(date '+%d-%m-%Y_%H:%M:%S')
    mkdir -p $SOURCE/backup/$ENV/$APP_NAME
    cp -r $SOURCE/$ENV/$APP_NAME/$1 $SOURCE/backup/$ENV/$APP_NAME/$1.$time_stamp
}

base_create_network()
{
    app_name=$1
    network_name=$2
    networks=$(docker network ls)
    if echo $networks | grep -q $1;
    then
        echo $app_name-$network_name exists
    else
        docker network create $app_name-$network_name
    fi 
}


base_clean()
{
    read -p "Backup before delete? [y/n]`echo $'\n > '`" want_backup
    if [[ $want_backup =~ ^[Yy]$ ]]
    then
        base_backup $1   
    fi 

    rm -rf $SOURCE/$ENV/$APP_NAME/$1/*
    find $SOURCE/$ENV/$APP_NAME/$1 -mindepth 1 -maxdepth 1 -name '.*' -exec rm -rf  +
}

