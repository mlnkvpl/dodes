#!/bin/bash

_completions(){

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

    case "$prev" in
        dev)
            COMPREPLY=( $(compgen -W "init up down restart clean" -- ${cur}) )
            ;;
        front)
            COMPREPLY=( $(compgen -W "init serve build backup clean" -- ${cur}) )
            ;;
        back)
            COMPREPLY=( $(compgen -W "init backup clean" -- ${cur}) )
            ;; 
        proxy)
            COMPREPLY=( $(compgen -W "init up down restart" -- ${cur}) )
            ;;    
        *)
            COMPREPLY=( $(compgen -W "dev proxy back front composer npm symfony version help" -- ${cur}) )
            ;;
    esac
    return 0
}


complete -F _completions %APP_NAME%
