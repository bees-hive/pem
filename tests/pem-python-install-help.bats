#!/usr/bin/env bats

load commons

@test "print 'Usage: ...' when run 'pem python-install help'" {
    run pem python-install help
    [[ "${lines[0]}" =~ "Usage: pem python-install <version>" ]]
}


