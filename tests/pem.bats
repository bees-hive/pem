#!/usr/bin/env bats

load commons

@test "print 'Usage: ...' when run 'pem'" {
  run pem
  [[ "${lines[0]}" =~ "Usage: pem <command>" ]]
  [[ "${lines[1]}" =~ "Usage: pem <command> help" ]]
}


@test "exit code is 0 when run 'pem'" {
  run pem
  [ "$status" -eq 0 ]
}


@test "exit code is 0 when run 'pem help'" {
  run pem help
  [ "$status" -eq 0 ]
}
