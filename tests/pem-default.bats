#!/usr/bin/env bats

load commons

@test "default: default Python will be set if <version> is set" {
    fake-pass pyenv "global 3.3.0"
    fake-pass pyenv "shell 3.3.0"
    run pem default 3.3.0
    [[ "${lines[0]}" =~ "Python's version as default" ]]
    [ $status -eq 0 ]
}

@test "default: default Python won't be set if <version> is not set" {
    run pem default
    [ $status -ne 0 ]
}
