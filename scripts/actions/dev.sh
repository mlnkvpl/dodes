#!/bin/bash

dev_actions(){
    case $1 in
        init)
            dev_init
        ;;
        up)
            dev_up
        ;;
        down)
            dev_down
        ;;
        restart)
            dev_restart
        ;;
        clean)
            dev_clean
        ;;
        help|*)
            echo -e "Usage: select.sh dev [init|up|down|restart|clean]"
        ;;
    esac
}