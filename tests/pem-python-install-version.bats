#!/usr/bin/env bats

load commons

@test "print 'Install ...' when run 'pem python-install <version>'" {
    run pem python-install 3.3.0
    [[ "${lines[0]}" =~ "Install '3.3.0' version of Python and make it as default Python's version." ]]
}
