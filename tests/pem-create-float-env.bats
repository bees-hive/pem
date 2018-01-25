#!/usr/bin/env bats

load commons



@test "create-float-env: float env creation works if both version and name are set" {
    fake-pass pyenv "virtualenv 2.7.12 my-env"
    run pem create-float-env 2.7.12 my-env
    [ "$status" -eq 0 ]
}

@test "create-float-env: float env raises error if version is not set" {
    run pem create-float-env
    [[ "${lines[0]}" == "Please specify Python's version (like 2.7.11)." ]]
    [ "$status" -eq 20 ]
}

@test "create-float-env: float env raises error if name is not set" {
    run pem create-float-env 2.7.14
    [[ "${lines[0]}" == "Please set a name for float virtual environment." ]]
    [ "$status" -eq 21 ]
}


@test "create-float-env: print 'Usage: ...'" {
    run pem create-float-env help
    [[ "${lines[0]}" == "Usage: pem create-float-env <version> <name>" ]]
    [ "$status" -eq 0 ]
}
