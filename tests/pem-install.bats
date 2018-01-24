#!/usr/bin/env bats

load commons

@test "install: installation works properly if version is set" {
    run pem install 3.3.0
    [[ "${lines[0]}" == "Versions to install: 3.3.0" ]]
}

@test "install: installation raises error if version is not set" {
    run pem install
    [[ "${lines[0]}" == "Please specify Python's version (like 2.7.11)." ]]
    [ "$status" -ne 0 ]
}

@test "install: installation works properly if several versions are set" {
    run pem install 3.3.0 3.3.1
    [[ "${lines[0]}" == "Versions to install: 3.3.0 3.3.1" ]]
}
