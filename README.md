**Python environment management**
=================================
`pem` tool allows easy manage different Python's versions and dependencies. To find out more, please visit [http://pem.extsoft.pro
](http://pem.extsoft.pro).

[![Rultor.com](http://www.rultor.com/b/bees-hive/pem)](http://www.rultor.com/p/bees-hive/pem)
[![PDD status](http://www.0pdd.com/svg?name=bees-hive/pem)](http://www.0pdd.com/p?name=bees-hive/pem)
[![Build Status](https://travis-ci.org/bees-hive/pem.svg?branch=master)](https://travis-ci.org/bees-hive/pem)

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
`brew install bees-hive/hive/pem`

To find out more [click here](https://github.com/bees-hive/homebrew-hive).

Contribution
============
If you have any questions/suggestions, please open a new issue.

Before send a pull request, make sure the tests are passed. Please use docker command from [.travis.yml](.travis.yml) to run the tests.
