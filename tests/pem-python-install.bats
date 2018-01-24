#!/usr/bin/env bats

load commons

@test "python-install: installation works properly if version is set" {
    run pem python-install 3.3.0
    [[ "${lines[0]}" =~ "Install Python '3.3.0'..." ]]
}

@test "python-install: installation raises error if version is not set" {
    run pem python-install 3.3.0
    [[ "${lines[0]}" =~ "Please specify Python's version (like 2.7.11)." ]]
    [ "$status" -ne 0 ]
}
