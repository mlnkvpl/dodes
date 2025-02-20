#!/bin/bash

# COMMAND PROMPT
case $1 in
    dev)
        case $2 in
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
        esac
    ;;
    front)
        case $2 in
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
            *)
                front_terminal ${@:2}
            ;;
        esac
    ;;
    back)
        case $2 in
            init)
                back_init
            ;;
            clean)
                back_clean
            ;;
            backup)
                back_backup
            ;;
            *)
                back_terminal ${@:2}
            ;;
        esac
    ;;
    proxy)
        case $2 in
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
            *)
                proxy_terminal ${@:2}
            ;;
        esac
    ;;
    composer)
        tools_composer ${@:2}
    ;;
    symfony)
        tools_symfony ${@:2}
    ;;
    npm)
        tools_npm ${@:2}
    ;;
    version|v)
        echo -e ${APP_NAME}"\nv."${VERSION} 
    ;;
    install)
        global_install
    ;;
    uninstall)
        global_uninstall
    ;;
esac