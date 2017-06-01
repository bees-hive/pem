**Python environment management**
=================================
`pem` tool allows easy manage different Python's versions and dependencies.

[![Rultor.com](http://www.rultor.com/b/extsoft/pem)](http://www.rultor.com/p/extsoft/pem)
[![PDD status](http://www.0pdd.com/svg?name=extsoft/pem)](http://www.0pdd.com/p?name=extsoft/pem)
[![Build Status](https://travis-ci.org/extsoft/pem.svg?branch=master)](https://travis-ci.org/extsoft/pem)

Installation
============

Manual
------
First of all, you have to install dependencies:
- [pyenv](https://github.com/pyenv/pyenv) 
- [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

Then, install `pem`: 

`curl https://raw.githubusercontent.com/extsoft/pem/master/install.bash | $(which bash)`

Homebrew
--------
`brew install extsoft/insight/pem`

To find out more [click here](https://github.com/extsoft/homebrew-insight).

Usage
=====
Run `pem help` to find out documentation. Example output: 
```
Usage: pem <command>
Usage: pem <command> help

Available commands are:
  help                Display current message.
  python-install      Install a version of Python.
  python-default      Configure default Python's env.
  python-remove       Remove a Python's version.
  folder-env          Configure local Python's environment for current folder.
  folder-state        Show Python's environment for current folder.
  folder-clean        Clean up Python's environment for current folder.

```
