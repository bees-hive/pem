#!/usr/bin/env bats

load commons

@test "create-dir-env: dir env raises error if version is not set" {
    run pem create-dir-env
    [[ "${lines[0]}" == "Please specify a version of Python (like 3.6.0)!" ]]
    [ "$status" -ne 0 ]
}

@test "create-dir-env: print 'Usage: ...'" {
    run pem create-dir-env help
    [[ "${lines[0]}" == "Usage: pem create-dir-env <version>" ]]
    [ "$status" -eq 0 ]
}
