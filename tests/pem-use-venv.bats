#!/usr/bin/env bats

load commons

@test "use-venv: default virtual environment will be set if <name> is set" {
    fake-pass pyenv "global 3.3.0"
    fake-pass pyenv "shell 3.3.0"
    run pem use-venv 3.3.0
    [[ "${lines[0]}" =~ "Make '3.3.0' virtual environment as default." ]]
    [ $status -eq 0 ]
}

@test "use-venv: default virtual environment won't be set if <name> is not set" {
    run pem use-venv
    [ $status -ne 0 ]
}

@test "use-venv: print 'Usage: ...'" {
    run pem use-venv help
    [[ "${lines[0]}" == "Usage: pem use-venv <name>" ]]
    [ "$status" -eq 0 ]
}
