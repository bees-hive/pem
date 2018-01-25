All available commands are described below. If you need more details, run `pem help` or `pem <command> help` to get them.

help
----
Displays a help message.

install
-------
Installs desired version of Python. In addition, the command updates `pip` to the latest version and installs `virtualenv` package. It's possible to pass several versions instead of one.

remove
------
Removes provided either version of Python or virtual environment. It's possible to pass several versions instead of one.

create-dir-venv
---------------
Creates a virtual environment based on given version and configures it as the local one for a current directory.

display-dir-venv
----------------
Displays Python's path which was configured for the directory. If the virtual environment is absent, a default Python's path will be displayed.

clean-dir-venv
--------------
Removes virtual environment which was configured for this directory.

create-float-venv
-----------------
Creates a float virtual environment. In order to use it, you have to run `use-float-venv`.

use-float-venv
--------------
Configures provided virtual environment as default for the system.

display-float-venv
------------------
Displays system's virtual environment.
