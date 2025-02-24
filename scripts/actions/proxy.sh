#!/bin/bash

proxy_actions(){
    case $1 in
        init)
            proxy_init
        ;;
        up)
            proxy_up
        ;;
        down)
            proxy_down
        ;;
        restart)
            proxy_restart
        ;;
        help|*)
            echo -e "Usage: select.sh proxy [init|up|down|restart]"
        ;;
    esac
}