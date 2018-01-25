#!/usr/bin/env bats

load commons

@test "display-float-venv: display Python path of the directory" {
    fake-pass pyenv "global" my-env-global
    run pem display-float-venv
    [[ "${lines[0]}" == "my-env-global" ]]
    [ $status -eq 0 ]

}

@test "display-float-venv: print 'Usage: ...'" {
    run pem display-float-venv help
    [[ "${lines[0]}" == "Usage: pem display-float-venv" ]]
    [ "$status" -eq 0 ]
}
