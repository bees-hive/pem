#!/bin/bash -e

SYM_LINK='venv'

_check_version(){
    if [ -z "$1" ]; then
        echo "Please specify Python's version (like 2.7.11)."
        exit -2
    fi
}

python-default() {
    _check_version $1
    echo "Make '$1' Python's version as default."
    pyenv global $1 && pyenv shell $1
}

python-remove() {
    [ -z "$1" ] && echo "Please set a version to be deleted. " && exit -
    echo "Remove '$1' version of Python from pyenv."
    pyenv uninstall -f $1
}

folder-env() {
    local FOLDER=${PWD##*/}
    read -p "Please enter a name of virtual env (hit Enter for default: '$FOLDER'): " NAME
    NAME=${NAME:-${FOLDER}}
    if [ -z "$NAME" ]; then
        echo "Virtual env name is not set"
        exit 1
    fi

    VERSION=$(pyenv global)
    read -p "Do you want to use '$VERSION' version of Python? [y/n] " DEFAULT
    case $DEFAULT in 
            [Yy]* ) echo "'$VERSION' version will be used." ;;
            [Nn]* ) echo -e "Avaliable: \n"; pyenv versions --bare --skip-aliases; read -p "Please set a version: " VERSION;;
            * ) echo "Version is not set! "; exit -1 ;;
    esac
    
    pyenv virtualenv $VERSION $NAME
    pyenv local $NAME
    ln -s `pyenv which python | sed -e 's/\/bin\/python//g'` ${SYM_LINK} && \
    echo "'$PWD/${SYM_LINK}' link is created to local Python folder."
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
