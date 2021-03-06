#!/usr/bin/env bats

load commons



@test "create-float-venv: float env creation works if both version and name are set" {
    fake-pass pyenv "virtualenv 2.7.12 my-env"
    run pem create-float-venv 2.7.12 my-env
    [ "$status" -eq 0 ]
}

@test "create-float-venv: float env raises error if version is not set" {
    run pem create-float-venv
    [[ "${lines[0]}" == "Please specify a version of Python (like 3.6.0)!" ]]
    [ "$status" -eq 20 ]
}

@test "create-float-venv: float env raises error if name is not set" {
    run pem create-float-venv 2.7.14
    [[ "${lines[0]}" == "Please specify a virtual environment name!" ]]
    [ "$status" -eq 21 ]
}


@test "create-float-venv: print 'Usage: ...'" {
    run pem create-float-venv help
    [[ "${lines[0]}" == "Usage: pem create-float-venv <version> <name>" ]]
    [ "$status" -eq 0 ]
}
