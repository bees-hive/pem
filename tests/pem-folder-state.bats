#!/usr/bin/env bats

load commons

setup() {
    fake-pass pyenv global 33.1
    fake-pass pyenv local 32.1
    fake-pass pyenv "which python" /my/python
}

@test "print 'Global Python: ...' when run 'pem folder-state'" {
    run pem folder-state
    [ "${lines[0]}" = "Global Python: 33.1" ]
}

@test "print 'Local Python: ...' when run 'pem folder-state'" {
    run pem folder-state
    [[ "${lines[1]}" =~ "Local Python: 32.1" ]]
}

