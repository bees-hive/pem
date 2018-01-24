#!/usr/bin/env bats

load commons

@test "print 'Usage: ...' when run 'pem install help'" {
    run pem install help
    [[ "${lines[0]}" =~ "Usage: pem install <version>" ]]
}


