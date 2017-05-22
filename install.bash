#!/usr/bin/env bash -e

[ -z "$PEM_INSTALL_PATH" ] && PEM_INSTALL_PATH="$HOME/.pem"
[ -z "$PEM_REPO_HOME" ] && PEM_REPO_HOME="https://github.com/extsoft/pem.git"

man() {
    echo "Usage: ./install.bash [install|uninstall]"
    echo "Configuration:"
    echo "  PEM_INSTALL_PATH=$PEM_INSTALL_PATH"
    echo "  PEM_REPO_HOME=$PEM_REPO_HOME"
}

run() {
    echo "$1"
    eval "$1"
}

install() {
    echo "Installing pem to $PEM_INSTALL_PATH"
    run "rm -rfv $PEM_INSTALL_PATH"
    run "mkdir -p $PEM_INSTALL_PATH"
    if [ $1 = 'git' ]; then
        run "git clone --depth 1 $PEM_REPO_HOME $PEM_INSTALL_PATH"
        cd "$PEM_INSTALL_PATH"
        rm -rf .git
    elif [ $1 = 'dev' ]; then
        cp -rv $(dirname "$0")/* $PEM_INSTALL_PATH
    else
        echo "Unexpected mode: $1"
    fi

    echo "Add the following to your .bash_profile to allow:"
    echo "#pem command"
    echo "export PATH=$PEM_INSTALL_PATH/bin:\$PATH"
    echo "#pem completion"
    echo "[ -f $PEM_INSTALL_PATH/bin/pem-completion ] && . $PEM_INSTALL_PATH/bin/pem-completion"
    echo ""
    echo "Then please restart the terminal and enjoy the 'pem'!"
}

uninstall() {
    echo "Uninstalling pem from $PEM_INSTALL_PATH"
    run "rm -rfv $PEM_INSTALL_PATH"
}

case "$1" in
    uninstall)  uninstall                   ;;
    help)       man                         ;;
    dev)        uninstall && install dev    ;;
    *)          uninstall && install git    ;;
esac
