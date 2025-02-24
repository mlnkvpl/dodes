#!/bin/bash

back_actions(){
    case $1 in
        init)
            back_init
        ;;
        clean)
            back_clean
        ;;
        backup)
            back_backup
        ;;
        help|*)
            echo -e "Usage: select.sh back [init|clean|backup]"
        ;;
    esac
}