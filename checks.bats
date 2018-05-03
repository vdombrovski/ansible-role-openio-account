#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Unlock meta0' {
  run bash -c "docker exec -ti ${SUT_ID} openio --oio-ns TRAVIS cluster unlock meta0 172.17.0.2:6001"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'unlocked' ]]
}

@test 'Check score meta0' {
  run bash -c "docker exec -ti ${SUT_ID} openio cluster list --oio-ns TRAVIS --stats"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ ! "${output}" =~ '"Score": 0,' ]]
}
