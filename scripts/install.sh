#!/bin/bash

app_path="$PWD/bin"
autocomplete_script="$PWD/scripts/autocomp.sh"
path_to_bashrc="$HOME/.bashrc"

global_install(){
    mkdir $SOURCE/bin &&
    cp $SOURCE/console $SOURCE/bin/$APP_NAME &&
    sed -i "s|%APP_NAME%|${APP_NAME}|" $SOURCE/bin/$APP_NAME && 
    cp $SOURCE/scripts/autocomp.sh $SOURCE/bin/autocomp.sh &&
    sed -i "s|%APP_NAME%|${APP_NAME}|" $SOURCE/bin/autocomp.sh &&
    echo -e "#${APP_NAME}\nPATH=$app_path:\$PATH\nsource $autocomplete_script\n#${APP_NAME}" >> $path_to_bashrc &&
    echo -e "Run:\n${Cyan}source $path_to_bashrc${Color_Off}\n"
}

global_uninstall(){
    rm -rf $SOURCE/bin &&
    sed -z "s|\#${APP_NAME}\n.*\n\#${APP_NAME}||g" -i "$path_to_bashrc" &&
    echo -e "Run:\n${Cyan}source $path_to_bashrc${Color_Off}\n"  
}