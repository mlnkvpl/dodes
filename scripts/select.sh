#!/bin/bash

source $SOURCE/scripts/actions/base.sh

# COMMAND PROMPT
case $1 in
    dev)
        dev_actions ${@:2}
    ;;
    front)
        front_actions ${@:2}
    ;;
    back)
        back_actions ${@:2}
    ;;
    proxy)
        proxy_actions ${@:2}
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
    help|*)
        echo -e "Usage: select.sh [dev|front|back|proxy|composer|symfony|npm|version|install|uninstall] [action]"
    ;;
esac