All available commands are described below. If you need more details, run `pem help` or `pem <command> help` to get them.

help
----
Displays a help message.

install
-------
Installs desired version of Python. In addition, the command updates `pip` to the latest version and installs `virtualenv` package. It's possible to pass several versions instead of one.

default
-------
Configures provided Python's version as default for the system.

remove
------
Removes provided Python's version. It's possible to pass several versions instead of one.

clean-dir-env
-------------
Removes Python's virtual environment which was configured for this directory.

create-dir-env
--------------
Creates a virtual environment based on given version and configures it as the local one for a current directory.

display-dir-env
---------------
Displays Python's path which was configured for the directory. If the virtual environment is absent, a default Python's path will be displayed.

create-float-env
----------------
Creates a float virtual environment. In order to use it, you have to `activate` it.

activate
--------
Activates a virtual environment.

@todo #58 Implement `activate` command
