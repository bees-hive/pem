#!/bin/bash -e

SYM_LINK='venv'

_check_version(){
    if [ -z "$1" ]; then
        echo "Please specify Python's version (like 2.7.11)."
        exit -2
    fi
}

folder-state() {
    echo "Global Python:" `pyenv global`
    echo "Local Python: `pyenv local 2>&1` (python is `pyenv which python 2>&1`)"
}

folder-clean() {
    ls ${SYM_LINK} 1>/dev/null || exit -5
    rm -rf ${SYM_LINK} && echo "'${SYM_LINK}' link is removed."
    python-remove $(cat .python-version)
    pyenv local --unset && echo "Local version of Python is unset for this folder."
}

commands(){
    echo 'python-install' 
    echo 'python-default' 
    echo 'python-remove' 
    echo 'folder-env'
    echo 'folder-state'
    echo 'folder-clean'
    echo 'commands' 
}

FUNC=$1
[ -z "$FUNC" ] && commands && exit -1
shift
eval '$FUNC $@'
