#!/usr/bin/env bats

load commons

@test "display-venv: display Python path of the directory" {
    fake-pass pyenv "global" my-env-global
    run pem display-venv
    [[ "${lines[0]}" == "my-env-global" ]]
    [ $status -eq 0 ]

}

@test "display-venv: print 'Usage: ...'" {
    run pem display-venv help
    [[ "${lines[0]}" == "Usage: pem display-venv" ]]
    [ "$status" -eq 0 ]
}
