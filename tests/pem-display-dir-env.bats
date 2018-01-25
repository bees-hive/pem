#!/usr/bin/env bats

load commons

@test "display-dir-env: display Python path of the directory" {
    fake-pass pyenv "which python" /my/python
    run pem display-dir-env
    [[ "${lines[0]}" == "/my/python" ]]
    [ $status -eq 0 ]

}

@test "display-dir-env: print 'Usage: ...'" {
    run pem display-dir-env help
    [[ "${lines[0]}" == "Usage: pem display-dir-env" ]]
    [ "$status" -eq 0 ]
}
