#!/bin/bash

test_function_return_status_code(){
  status

  assertEquals 200 $?
}

test_function_return_result_by_echo(){
  assertEquals "bar" $(result 1)
  assertEquals "bar" $(result 0)
}

status(){
  return 200
}

result(){
  echo "bar"
  return $1
}
