#!/usr/bin/env bats

load commons

@test "display-dir-venv: display Python path of the directory" {
    fake-pass pyenv "which python" /my/python
    run pem display-dir-venv
    [[ "${lines[0]}" == "/my/python" ]]
    [ $status -eq 0 ]

}

@test "display-dir-venv: print 'Usage: ...'" {
    run pem display-dir-venv help
    [[ "${lines[0]}" == "Usage: pem display-dir-venv" ]]
    [ "$status" -eq 0 ]
}
