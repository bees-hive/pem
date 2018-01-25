#!/usr/bin/env bats

load commons

@test "create-dir-venv: dir env raises error if version is not set" {
    run pem create-dir-venv
    [[ "${lines[0]}" == "Please specify a version of Python (like 3.6.0)!" ]]
    [ "$status" -ne 0 ]
}

@test "create-dir-venv: print 'Usage: ...'" {
    run pem create-dir-venv help
    [[ "${lines[0]}" == "Usage: pem create-dir-venv <version>" ]]
    [ "$status" -eq 0 ]
}
