#!/bin/bash

front_actions(){
    case $1 in
        init)
            front_init
        ;;
        serve)
            front_serve
        ;;
        build)
            front_build
        ;;
        clean)
            front_clean
        ;;
        backup)
            front_backup
        ;;
        help|*)
            echo -e "Usage: select.sh front [init|serve|build|clean|backup]"
        ;;
    esac
}