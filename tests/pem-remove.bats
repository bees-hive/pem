#!/usr/bin/env bats

load commons

@test "remove: removal works properly if version is set" {
    fake-pass pyenv "uninstall -f 3.3.0"
    run pem remove 3.3.0
    [ "$status" -eq 0 ]
}

@test "remove: removal raises error if version is not set" {
    run pem remove
    [[ "${lines[0]}" == "Please specify Python's version (like 2.7.11)." ]]
    [ "$status" -ne 0 ]
}

@test "remove: removal works properly if several versions are set" {
    fake-pass pyenv "uninstall -f 3.3.0"
    fake-pass pyenv "uninstall -f 3.3.1"
    run pem remove 3.3.0 3.3.1
    [ "$status" -eq 0 ]
}
