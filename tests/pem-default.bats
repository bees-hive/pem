#!/usr/bin/env bats

load commons

@test "default: default Python will be set if <version> is set" {
    run pem default 3.3.0
    [[ "${lines[0]}" =~ "Python's version as default" ]]
}

@test "default: default Python won't be set if <version> is not set" {
    run pem default
    [ $status -ne 0 ]
}
