#!/bin/bash

_python_advanced() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${prev}" in 
        python-remove | python-default) 
            COMPREPLY=( $(compgen -W "$(pyenv versions --bare --skip-aliases)" ${cur}) )
            return 0 ;; 
        python-install)
            local data=$(pyenv install --list | sed '/Available versions:/d')
            COMPREPLY=( $(compgen -W "${data}" ${cur}) )
            return 0 ;; 
        *) ;; 
    esac
    
    opts=($(py commands))
    COMPREPLY=( $(compgen -W "${opts[*]}" -- ${cur}) )
}
complete -F _python_advanced py
