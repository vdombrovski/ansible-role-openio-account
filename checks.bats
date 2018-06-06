#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Gridinit unit present' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/gridinit.d/TRAVIS/account-0.conf"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ '/usr/bin/oio-account-server /etc/oio/sds/TRAVIS/account-0/account-0.conf' ]]
}

@test 'Conf account' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds/TRAVIS/account-0/account-0.conf"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'redis_host = 172.17.0.2' ]]
  [[ "${output}" =~ 'redis_port = 6011' ]]
  [[ "${output}" =~ 'syslog_prefix = OIO,TRAVIS,account,0' ]]
}

@test 'Watch file account' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/oio/sds/TRAVIS/watch/account-0.yml"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'port: 6009' ]]
  [[ "${output}" =~ '  - {type: http, path: /status, parser: json}' ]]
}

@test 'Account answer to a request' {
  run bash -c "curl http://${SUT_IP}:6009/status"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ '{"account_count": 0}' ]]
}
