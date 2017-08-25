#!/bin/bash

test_function_return_status_code(){
  status(){
    return 200
  }

  status

  assertEquals 200 $?
}

test_function_return_result_by_echo(){
  result(){
    echo "bar"
    return $1
  }

  assertEquals "bar" $(result 1)
  assertEquals "bar" $(result 0)
}

test_create_function_with_function_keyword(){
  function pass { 
    echo "PASS"
  }

  assertEquals "PASS" $(pass)
}

test_function_scope(){
  scope(){
    local(){
      echo "SCOPE"
    }

    echo $(local)
  }
  
  local(){ 
    echo "LOCAL"
  }

  assertEquals "SCOPE" $(scope)
  assertEquals "LOCAL" $(local)
}
